/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utills;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.imageio.ImageIO;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class ImageUtils {
    public static Image resize(Image originalImg, int newWidth, int newHeight){
        Image resultingImg = originalImg.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
        return resultingImg;}
        public static byte[] toByteArray(Image img, String type) throws IOException{
            BufferedImage bimg = new BufferedImage(img.getWidth(null),img.getHeight(null), BufferedImage.TYPE_INT_BGR);
            Graphics2D g = bimg.createGraphics();
            g.drawImage(img, 0, 0, null);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bimg, type, baos);
            byte[] imageInByte = baos.toByteArray();
            return imageInByte;
        }
    public static Image createImgFromByteArray(byte[] data, String type) throws IOException {
        ByteArrayInputStream bis=new ByteArrayInputStream(data);
        BufferedImage bImage2 = ImageIO.read(bis);
        Image img = bImage2.getScaledInstance(bImage2.getWidth(), bImage2.getHeight(), Image.SCALE_SMOOTH);
        return img;
    }
}
