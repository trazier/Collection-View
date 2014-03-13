//
//  CVViewController.m
//  CollectionViews
//
//  Created by Frazier Moore on 3/6/14.
//  Copyright (c) 2014 Frazier Moore. All rights reserved.
//

#import "CVViewController.h"
#import "UIColor+RandomColor.h"
#import "PhotoCell.h"

@interface CVViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *photos;

@property (nonatomic, strong)IBOutlet UICollectionView *collectionView;


@end

@implementation CVViewController

NSIndexPath *startLocation;
NSIndexPath *endLocation;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    // allocate the array of PhotoCell objects
    _photos = [[NSMutableArray alloc] init];
    
    // add the pictures with the given name
    for (int i=1; i<11; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [_photos addObject:image];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // already being done
//    [collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"PhotoCell"];
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    cell.photoImageView.image = self.photos[indexPath.row];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1; //seconds
    lpgr.delegate = self;
    [collectionView addGestureRecognizer:lpgr];
    
    return cell;
}

-(IBAction)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{

    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        CGPoint p = [gestureRecognizer locationInView:self.view];
        startLocation = [self.collectionView indexPathForItemAtPoint:p];
        NSLog(@"Press Began");
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint p = [gestureRecognizer locationInView:self.view];
        
        endLocation = [self.collectionView indexPathForItemAtPoint:p];
        
        NSLog(@"Press Ended");
        
        if (startLocation != endLocation) {
            
            [_collectionView moveItemAtIndexPath:startLocation toIndexPath:endLocation];
            
        }
    }
}




@end