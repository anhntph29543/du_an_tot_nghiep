package com.example.datn.controller.restcontroller;

import java.util.ArrayList;
import java.util.List;

public class chan {

    public static void main(String[] args) {
        List<Integer> number=new ArrayList<>();
        number.add(1);
        number.add(1);
        number.add(2);
        number.add(3);
        number.add(2);
        number.add(4);
        number.add(1);
        number.add(3);
        number.add(4);
        number.add(1);
        List<Integer> abc=new ArrayList<>();
        for(int i=0;i<number.size();i++){
            int count=0;
            for (int j=0;j<number.size();j++){
                if(number.get(i)==number.get(j)){
                    count++;
                }
            }
            if(count>1){
                int chan=0;
                for (Integer ab:abc) {
                    if(number.get(i)==ab){
                        chan++;
                    }
                }
                if(chan==0){
                    abc.add(number.get(i));
                }
            }
        }
        System.out.println(abc);
    }
}
