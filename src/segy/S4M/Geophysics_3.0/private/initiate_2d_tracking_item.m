function initiate_2d_tracking_item(options_menu_handle,xinfo,yinfo,bool)
% Initiate picking on a 2-d plot (no z-component)
%
% Written by: E. Rietsch: September 14, 2003
% Last updated: December 10, 2005: New condition for creating a menu button 
%                                  for tracking
%
%        initiate_2d_tracking(xinfo,yinfo,bool)
% INPUT
% options_menu_handle   handle of the "Options" menu for which this is a menu item
% xinfo  info about x-coordinates (optional)
% yinfo  info about y-coordinates (optional)
% bool   logicl variable; if "bool" is true then menu button will be created
%        Default: function creates a button if it does not alredy exist


if nargin < 4
   bool=true;
end

if nargin < 3
   xinfo={'x','','x'};
   yinfo={'y','','y'};
end
        
        % Implement cursor tracking
userdata.tag='display_cursor_location_2d';
userdata.userpointer='cross';
userdata.ah=gca;
userdata.bgcolor=get(gcf,'Color');
userdata.position=[0,0,300,20];

userdata.xformat='%8.5g';
userdata.xname=xinfo{1};
userdata.xunits=units4plot(xinfo{2});

userdata.yformat='%8.5g';
userdata.yname=yinfo{1};
userdata.yunits=units4plot(yinfo{2});

setappdata(userdata.ah,'userdata_2d_tracking',userdata);


%	Check if a menu button for cursor tracking needs to be created

if nargin < 4
   handle=findobj(gcf,'Tag','tracking_button');
   if isempty(handle)
      create_menu_item4tracking({@display_cursor_location_2d},options_menu_handle);
   end
else
  if bool
     create_menu_item4tracking({@display_cursor_location_2d},options_menu_handle);
  end
end
