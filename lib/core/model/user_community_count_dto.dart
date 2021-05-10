class UserCommunityCountDto {
   int totalChildren;
   int totalEvents;
   int totalSubscribers;
   int totalUsers;

   UserCommunityCountDto(
       {this.totalChildren,
         this.totalEvents,
         this.totalSubscribers,
         this.totalUsers,
       });
   UserCommunityCountDto.fromJson(Map<String, dynamic> json) {
     totalChildren = json['totalChildren'];
     totalEvents = json['totalEvents'];
     totalSubscribers = json['totalSubscribers'];
     totalUsers = json['totalUsers'];
   }


   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     if (this.totalChildren != null) {
       data['totalChildren'] = this.totalChildren;
     }
     if (this.totalEvents != null) {
       data['totalEvents'] = this.totalEvents;
     }
     if (this.totalSubscribers != null) {
       data['totalSubscribers'] = this.totalSubscribers;
     }
     if (this.totalUsers != null) {
       data['totalUsers'] = this.totalUsers;
     }
     return data;
   }

}