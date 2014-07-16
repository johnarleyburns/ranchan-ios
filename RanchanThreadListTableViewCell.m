//
//  RanchanThreadListTableViewCell.m
//  iosApp
//
//  Created by John Arley Burns on 12/07/14.
//  Copyright (c) 2014 Chanapps Software LLC. All rights reserved.
//

#import "RanchanThreadListTableViewCell.h"

const int RANCHAN_THUMB_MARGIN = 5;
const int RANCHAN_THUMB_SIZE = 120;
const int RANCHAN_THUMB_TEXT_LEFT = 2 * RANCHAN_THUMB_MARGIN + RANCHAN_THUMB_SIZE;
const int RANCHAN_LIST_CELL_HEIGHT = 2 * RANCHAN_THUMB_MARGIN + RANCHAN_THUMB_SIZE;

@implementation RanchanThreadListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(RANCHAN_THUMB_MARGIN, RANCHAN_THUMB_MARGIN, RANCHAN_THUMB_SIZE, RANCHAN_THUMB_SIZE);
    //float limgW =  self.imageView.image.size.width;
    //if(limgW > 0) {
        self.textLabel.frame = CGRectMake(RANCHAN_THUMB_TEXT_LEFT,self.textLabel.frame.origin.y,self.textLabel.frame.size.width,self.textLabel.frame.size.height);
        self.detailTextLabel.frame = CGRectMake(RANCHAN_THUMB_TEXT_LEFT,self.detailTextLabel.frame.origin.y,self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height);
    //}
    self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y,
                                        self.contentView.frame.size.width, RANCHAN_LIST_CELL_HEIGHT);
    //[self.contentView sizeToFit];
}

@end
