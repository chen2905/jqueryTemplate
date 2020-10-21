using System;
using System.Collections.Generic;

namespace jQueryTemplate.Models
{
    public class CheckBoxModel
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public bool Checked { get; set; }

        public List<CheckBoxModel> Children { get; set; }
    }

    public static class CheckBoxRepository
    {
        private static List<CheckBoxModel> CheckBoxes { get; set; }

        public static void Initiate()
        {
            CheckBoxes = new List<CheckBoxModel>();

            const int count1 = 10, count2 = 10, count3 = 20;
            var idSeed = 1000000;
            for (var i = 1; i <= count1; i++)
            {
                var ckBoxTier1 = new CheckBoxModel
                {
                    Id = ++idSeed,
                    Text = "Item No." + i,
                    Checked = idSeed % 2 != 0,
                    Children = new List<CheckBoxModel>()
                };
                CheckBoxes.Add(ckBoxTier1);

                if (i % 2 == 0) { continue; }

                for (int j = 1; j <= count2; j++)
                {
                    var ckBoxTier2 = new CheckBoxModel
                    {
                        Id = ++idSeed,
                        Text = "Item No." + i + "." + j,
                        Checked = idSeed % 2 != 0,
                        Children = new List<CheckBoxModel>()
                    };
                    ckBoxTier1.Children.Add(ckBoxTier2);

                    if (j % 2 == 0) { continue; }

                    for(var k = 1; k <= count3; k++)
                    {
                        var ckBoxTier3 = new CheckBoxModel
                        {
                            Id = ++idSeed,
                            Text = "Item No." + i + "." + j + "." + k,
                            Checked = idSeed % 2 != 0,
                            Children = new List<CheckBoxModel>()
                        };
                        ckBoxTier2.Children.Add(ckBoxTier3);
                    }
                }
            }
        }

        public static List<CheckBoxModel> GetCheckBoxes()
        {
            return CheckBoxes;
        }
    }
}