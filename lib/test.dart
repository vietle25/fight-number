// class Solution {
//   bool backspaceCompare(String s, String t) {
//     List<String> arrS = s.split('#');
//     String resS = arrS.length == 1
//         ? arrS[0]
//         : arrS
//             .map((e) => arrS.indexOf(e) != arrS.length - 1 && e.isNotEmpty
//                 ? e.substring(0, e.length - 1)
//                 : e)
//             .join();
//
//     List<String> arrT = t.split('#');
//     print(t);
//     print(arrT);
//     String resT = arrT.length == 1
//         ? arrT[0]
//         : arrT
//             .map((e) => arrT.indexOf(e) != arrT.length - 1 && e.isNotEmpty
//                 ? e.substring(0, e.length - 1)
//                 : e)
//             .join();
//
//     return resS.trim() == resT.trim();
//   }
// }
//
// void main() {
//   var res = backspaceCompare("hd#dp#czsp#####", "hd#dp#czsp######");
//   print(res);
// }
//
// bool backspaceCompare(String s, String t) {
//   List<String> a = s.split('#');
//   List<String> b = t.split('#');
//   String c = '';
//   String d = '';
//   int x = a.length - 1;
//   int y = b.length - 1;
//   int da = 0;
//   int db = 0;
//
//   while (x >= 0 || y >= 0) {
//     da++;
//     db++;
//     if (x >= 0) {
//       if (a[x] != '') {
//         if (x == a.length - 1) {
//           c += a[x];
//           da = 0;
//         } else {
//           int s = a[x].length - da;
//           c = a[x].substring(0, s < 0 ? 0 : s) + c;
//           da = 0;
//           if (s < 0) {
//             da = s.abs();
//           }
//         }
//       } else {
//         if (x == a.length - 1) da = 0;
//         // da++;
//       }
//     }
//     if (y >= 0) {
//       if (b[y] != '') {
//         if (y == b.length - 1) {
//           d += b[y];
//           db = 0;
//         } else {
//           int s = b[y].length - db;
//           d = b[y].substring(0, s > 0 ? s : 0) + d;
//           db = 0;
//           if (s < 0) {
//             db = s.abs();
//           }
//         }
//       } else {
//         if (y == b.length - 1) db = 0;
//         // db++;
//       }
//     }
//
//     x--;
//     y--;
//   }
//
//   return c == d;
// }
