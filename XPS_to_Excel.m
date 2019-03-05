%% This file is only appropriate for XPS data reading
% Read the file directly from TGA software
%Instrument
clear
clc
close('all')
%data read from XPS data
%change the start path for different computer
Folder_path=uigetdir('E:\phd\Experiments\XPS','select the XPS data file');
%find all the file in it.
listing = dir(Folder_path);

%set the name of your final excel name
name = input('what is your new excel name: ','s');

%read all atom element data
for i = 1: length(listing)
    if (contains(listing(i).name,'txt'))
        if(contains(listing(i).name,'-'))
        else
            filename=[Folder_path,'\',listing(i).name];
            XPSfile=importdata(filename,' ');
            XPSfile(1:3)=[];
            for j=1:length(XPSfile)
            XPSdat(j,:)=strsplit(XPSfile{j},'\t');
            end
            SheetName = strrep(listing(i).name,'.txt','');
            xlswrite([Folder_path,'/',name,'.xlsx'],XPSdat,SheetName,'A1');
            clear XPSdat;
        end
    end
end
