class RapportPdf < Prawn::Document
  
  def desv(fsize,nchar)
    salida=0.6*fsize*nchar+1.6
  end 
   
  def initialize(find_diags)
    @find_diags = find_diags
    super(:skip_page_creation => true)
    page1
    page2
    page3
  end
  def config_font
    font "Courier"
    fsize = 9  
    font_size fsize 
    fsize     
  end
  
  def points(mm_col,mm_row)
    mm2points = 500/17.15
    points_col = mm_col.map {|h| mm2points*h}
    points_row = mm_row.map {|h| mm2points*h}
    [points_col,points_row]
  end
  
  def page1   
    start_new_page(:template => "#{Rails.root}/public/pdfs/raport1.pdf")
    config_font
     
    mm_col = [ 6.16,  6.95,  7.72,  8.42,  9.20,  9.80, 10.41, 11.00, 12.1,
              12.70, 13.80, 14.65, 15.35, 16.05, 16.65, 17.40 ] 
    
    mm_row = [ 2.12,  2.56,  3.00,  3.45,  3.90,  4.35,  4.80,  5.25,  5.69,  6.14,
               6.52,  6.97,  7.41,  7.85,  8.30,  8.75,  9.19,  9.60, 10.04, 10.47,
              10.91, 11.34, 11.78, 12.20, 12.64, 13.10, 13.78, 14.24, 14.92, 15.35,
              15.78, 16.22, 16.68, 17.09, 17.52, 17.98, 18.38, 18.84, 19.51, 19.95, 
              20.39, 20.82 ]
    points_col, points_row = points(mm_col,mm_row)
              
    go_to_page(page_count)

     @find_diags.each do |h|
       p h[0]
     end
     i=0
     @find_diags[0..21].each do |h| 
        if h[0] < 22
        i = 42 - 2*h[0]
        (0..14).each do |n| 
          dsize = h[1][n].to_s.size          
          #draw_text h[1][n].to_s, :at => [ points_col[2*n+1]-desv(config_font,dsize), points_row[i]+3]         
          draw_text h[1][n].to_s, :at => [ points_col[n+1]-desv(config_font,dsize), points_row[i]+3]         
        end
      end
    end        
  end
  
  def page2    
    start_new_page(:template => "#{Rails.root}/public/pdfs/raport2.pdf")
    config_font
     
    mm_col=[ 6.30,   7.08,  7.87,   8.56,   9.32,  9.95, 10.56, 11.13, 12.22,
            12.84,  13.93,  14.78, 15.47, 16.19, 16.77, 17.52]

    mm_row=[ 2.19,  2.63,   3.07,  3.52,  3.97,  4.41,  4.86,  5.31,   5.75,   6.20,
             6.64,  7.09,   7.53,  7.97,  8.42,  8.87,  9.31,  9.79,  10.80,  11.22, 
            12.30,  12.74, 13.47, 13.92, 14.37, 14.82, 15.25,  15.68, 16.12,  16.58, 
            17.06,  17.51, 17.96, 18.38, 18.84, 19.31, 19.75, 20.19,  20.62, 21.06,
            21.53,  21.97, 22.44, 22.89, 23.33, 23.80, 24.21, 24.67,  25.13]        
    points_col, points_row = points(mm_col,mm_row)

    go_to_page(page_count)

    @find_diags.each do |h|
      if h[0] > 21  and h[0] <47         
        (0..14).each do |n| 
          i = 90 - 2*h[0] 
          p i       
          dsize = h[1][n].to_s.size
          draw_text h[1][n].to_s, :at => [points_col[n+1]-desv(config_font,dsize), points_row[i]+3]
        end
      end
    end    
  end
  
  def page3  
    start_new_page(:template => "#{Rails.root}/public/pdfs/raport3.pdf")
    config_font
     
    mm_col=[ 6.27,   7.04,  7.81,   8.48,   9.19,  9.78, 10.39, 10.96, 12.00,
             12.60,  13.70,  14.53, 15.18, 15.89, 16.43, 17.16]

     mm_row=[   11.26,  11.71, 12.21,  12.65, 13.03, 13.47, 13.92, 14.37, 14.82, 15.25,  
                15.68, 16.12,  16.54, 16.98,  17.42, 17.80, 18.24, 18.65, 19.10, 19.53, 
                20.02,  20.42, 20.88, 21.27, 21.72,  22.17, 22.60, 23.04, 23.45, 23.87, 24.31]
    points_col, points_row = points(mm_col,mm_row)
    go_to_page(page_count)
    @find_diags.each do |h|
      if h[0] > 46  and h[0]<62
        p h[0]        
        (0..14).each do |n| 
          i = 122 - 2*h[0]       
          dsize = h[1][n].to_s.size
          draw_text h[1][n].to_s, :at => [points_col[n+1]-desv(config_font,dsize), points_row[i]+3]
        end
      end  
    end
  end
  
end


