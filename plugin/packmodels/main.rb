
module ::Skalp
  def self.start_new_process(cmd)
    puts "caller: #{caller}\n"
    puts "cmd: #{cmd}\n"
    super
  end
end



#module ::SkModelBox::EntityManager
#  def self.load_fence_or_profile(cmd)
#    puts "SK:caller: #{caller}\n"
#    puts "SK:cmd: #{cmd}\n"
#    super
#  end
#end

module Packdir
  module Packmodels

    # Clear Ruby Console
    def self.clear_console
      SKETCHUP_CONSOLE.clear
    end

    def self.start
      puts "2023"
    end

    def self.start1(filename = 'D:/skalp_output.txt')

      #class ::Skalp
      #  def start_new_process(cmd)
      #    puts "1201 start_new_process\n"
      #    puts "cmd: #{cmd}\n"
      #    super(cmd)
      #  end
      #end 

      #puts "1201 start packmodels"
      #a = ::Skalp.new
      #a.start_new_process
      #def do1
        #filename="D:/skalp_output.txt"
        #filename = File.join(File.dirname(__FILE__),filename)
        line_num =0
        prefix1="dd"
        # prefix1="*L*R0G0B0"
        prefix2="*L*R0G0B100"
        prefix1="*L*R63G63B63"
        prefix2="*L*R52G48B41"
        text = File.read(filename)
        text.gsub!(/\r\n?/, "\n")
        len_prefix1=prefix1.length
        len_prefix2=prefix2.length
        pts=[]
        text.each_line do |line|
          prefix=nil
          len_prefix=nil
          if line.start_with?(prefix1)
            prefix=prefix1
            len_prefix=len_prefix1
          elsif line.start_with?(prefix2)
            prefix=prefix2
            len_prefix=len_prefix2
          end
          if prefix
            line2=line[len_prefix,line.length]
            # line3=line2[2,line2.length-5]
            line3=line2[1,line2.length-3]
            line4=line3.scan(/\[[^\]]*\]/)

            pts_row=[]
            line4.each do |l2|
              l=l2[1,l2.length-1]
              index=l.index(",")
              data1=l[0,index]
              data2=l[index+1,l.length]
              pt= Geom::Point3d.new(data1.to_f,data2.to_f,0)
              pts_row << pt
            end

            # line4=line3.split("],[")
            # pts_row=[]
            # line4.each do |l|
            #   index=l.index(",")
            #   data1=l[0,index]
            #   data2=l[index+1,l.length]
            #   pt= Geom::Point3d.new(data1.to_f,data2.to_f,0)
            #   pts_row << pt
            # end
            pts << pts_row
            # puts "#{line_num} #{line3}\r\n"
            line_num += 1
          end
        end
        gr=Sketchup.active_model.entities.add_group
        entities=gr.entities
        pts.each do |row|
          entities.add_line(row[0],row[1])
        end
        # pts.each do |row|
        #   puts "#{row[0]} #{row[1]}"
        # end
        nil
      #end
    end

    def self.generate_output_txt
      cmd = "D:/Henry/packdir/packmodels/plugin/packmodels/lib/Skalp.exe"
      #cmd = "C:/Users/huawei/AppData/Roaming/SketchUp/SketchUp 2021/SketchUp/Plugins/Skalp_Skalp/lib/Skalp.exe"
      arg1 = "get_exploded_entities"
      skp = "D:/temp5.skp"
      arg3 = 130.77513430544897
      arg3 = 330.77513430544897
      arg3 = 132.3581
      arg3 = 133.294864
      arg3 = 129.71725331794576

      arg4 = -1
      arg4 = 2

      arg5 = 0.9312890106535957
      arg5 = "Infinity"

      arg6 = "false"
      #arg6 = "true"

      arg7 = "63.694489812700766,39.172012964186884,16.33726060070494"
      #arg7 = "-11.712958984160359,-59.347468867604306,50.19527700480536"
      arg7 = "3.694489812700766,-1539.172012964186884,116.33726060070494"
      arg7 = "2.978,-80.259,48.542"
      arg7 = "-11.712958186655232,-59.05567537887899,49.70393648991156"

      #style_path = 'D:/skalp.style'
      #styles = Sketchup.active_model.styles
      #styles.add_style style_path, true
      #Sketchup.active_model.save

      v = Sketchup.active_model.active_view
      t = v.camera.target
      target = "#{t.x.to_f},#{t.y.to_f},#{t.z.to_f}"
      arg7 = target
      puts "777： #{arg7}\n\n"
      arg7 = "23.004238481157447,-59.347468868337,40.2824000390355"
      arg7 = "-20.999556151252598,35.416303853335314,49.09448278231896"

      begin
        system "#{cmd}","#{arg1}","#{skp}","#{arg3}","#{arg4}","#{arg5}","#{arg6}","#{arg7}","1.0"
      rescue => e
        puts "Error: #{e}"
      end
    end

    # 读取文件
    

  end
end
