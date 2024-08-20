Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sgGrd-0001DQ-T3
	for mharc-qemu-trivial@gnu.org; Tue, 20 Aug 2024 00:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wh1sper@zju.edu.cn>)
 id 1sgEXn-0000Xk-Si
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2024 22:24:23 -0400
Received: from azure-sdnproxy.icoremail.net ([20.231.56.155])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wh1sper@zju.edu.cn>) id 1sgEXi-0001pc-Ue
 for qemu-trivial@nongnu.org; Mon, 19 Aug 2024 22:24:23 -0400
Received: from wh1sper$zju.edu.cn ( [101.82.68.47] ) by
 ajax-webmail-mail-app4 (Coremail) ; Tue, 20 Aug 2024 10:20:00 +0800
 (GMT+08:00)
X-Originating-IP: [101.82.68.47]
Date: Tue, 20 Aug 2024 10:20:00 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5byg5rWp54S2?= <wh1sper@zju.edu.cn>
To: qemu-trivial@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH] fix vhost_user_gpu_chr_read() where `size` was incorrectly
 passed to `msg->flags`
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240625(a75f206e) Copyright (c) 2002-2024 www.mailtech.cn zju.edu.cn
Content-Type: multipart/alternative; 
 boundary="----=_Part_291546_1426043346.1724120400002"
MIME-Version: 1.0
Message-ID: <4b2234bc.14983.1916d958082.Coremail.wh1sper@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgAHzFhQ_cNmf85nAg--.15757W
X-CM-SenderInfo: asssliaqzvq6lmxovvfxof0/1tbiAggTB2bDWKYK2AAAsX
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUCw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=20.231.56.155; envelope-from=wh1sper@zju.edu.cn;
 helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Aug 2024 00:52:59 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Aug 2024 02:24:24 -0000

------=_Part_291546_1426043346.1724120400002
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbSBiODk4Mzk2M2VmZGQ4MWRkNWViZWZkM2UyOWE4NWY0MTE5MjkzNmUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQoKRnJvbTogSGFvcmFuIFpoYW5nIDx3aDFzcGVyQHpqdS5lZHUuY24+CgpE
YXRlOiBUdWUsIDIwIEF1ZyAyMDI0IDEwOjA2OjQyICswODAwCgpTdWJqZWN0OiBbUEFUQ0hdIGZp
eCB2aG9zdF91c2VyX2dwdV9jaHJfcmVhZCgpIHdoZXJlIGBzaXplYCB3YXMgaW5jb3JyZWN0bHkK
CiBwYXNzZWQgdG8gYG1zZy0+ZmxhZ3NgCgoKCgpTaWduZWQtb2ZmLWJ5OiBIYW9yYW4gWmhhbmcg
PHdoMXNwZXJAemp1LmVkdS5jbj4KCgoKCi0tLQoKCgoKIGh3L2Rpc3BsYXkvdmhvc3QtdXNlci1n
cHUuYyB8IDIgKy0KCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCgoKCmRpZmYgLS1naXQgYS9ody9kaXNwbGF5L3Zob3N0LXVzZXItZ3B1LmMgYi9ody9kaXNw
bGF5L3Zob3N0LXVzZXItZ3B1LmMKCgoKCmluZGV4IDYzYzY0ZGRkZTYuLmMwYzY2OTEwZjEgMTAw
NjQ0CgotLS0gYS9ody9kaXNwbGF5L3Zob3N0LXVzZXItZ3B1LmMKCisrKyBiL2h3L2Rpc3BsYXkv
dmhvc3QtdXNlci1ncHUuYwoKQEAgLTM5MCw3ICszOTAsNyBAQCB2aG9zdF91c2VyX2dwdV9jaHJf
cmVhZCh2b2lkICpvcGFxdWUpCgogICAgIH0KCiAKCiAgICAgbXNnLT5yZXF1ZXN0ID0gcmVxdWVz
dDsKCi0gICAgbXNnLT5mbGFncyA9IHNpemU7CgorICAgIG1zZy0+ZmxhZ3MgPSBmbGFnczsKCiAg
ICAgbXNnLT5zaXplID0gc2l6ZTsKCiAKCiAgICAgaWYgKHJlcXVlc3QgPT0gVkhPU1RfVVNFUl9H
UFVfQ1VSU09SX1VQREFURSB8fAoKLS0gCgoyLjQzLjAKCgo=
------=_Part_291546_1426043346.1724120400002
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHN0eWxlIGNsYXNzPSJrZS1zdHlsZSI+CltsaXN0LXN0eWxlLXR5cGVdIHtwYWRkaW5nLWxlZnQ6
MjBweDtsaXN0LXN0eWxlLXBvc2l0aW9uOmluc2lkZX0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkge21h
cmdpbjowfQpbbGlzdC1zdHlsZS10eXBlXSBsaTpiZWZvcmUsIHNwYW4ua2UtbGlzdC1pdGVtLW1h
dHRlciB7Zm9udC1mYW1pbHk6InNhbnMgc2VyaWYiLHRhaG9tYSx2ZXJkYW5hLGhlbHZldGljYX0K
W2xpc3Qtc3R5bGUtdHlwZV0gbGkgcCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoMSxbbGlzdC1zdHls
ZS10eXBlXSBsaSBoMixbbGlzdC1zdHlsZS10eXBlXSBsaSBoMyxbbGlzdC1zdHlsZS10eXBlXSBs
aSBoNCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoNSxbbGlzdC1zdHlsZS10eXBlXSBsaSBkaXYsW2xp
c3Qtc3R5bGUtdHlwZV0gbGkgYmxvY2txdW90ZXtkaXNwbGF5OmlubGluZTt3b3JkLWJyZWFrOmJy
ZWFrLWFsbH0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkgdGFibGUge2Rpc3BsYXk6aW5saW5lLWJsb2Nr
O3ZlcnRpY2FsLWFsaWduOnRvcH0KcHttYXJnaW46MH0KdGQge3dvcmQtYnJlYWs6IGJyZWFrLXdv
cmR9Ci5kZWZhdWx0LWZvbnQtMTcyNDExOTY2ODQ3MXsKfQo8L3N0eWxlPjxkaXYgY2xhc3M9ImRl
ZmF1bHQtZm9udC0xNzI0MTE5NjY4NDcxIiBkaXI9Imx0ciI+PHA+RnJvbSBiODk4Mzk2M2VmZGQ4
MWRkNWViZWZkM2UyOWE4NWY0MTE5MjkzNmUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMTwvcD48
cD5Gcm9tOiBIYW9yYW4gWmhhbmcgJmx0O3doMXNwZXJAemp1LmVkdS5jbiZndDs8L3A+PHA+RGF0
ZTogVHVlLCAyMCBBdWcgMjAyNCAxMDowNjo0MiArMDgwMDwvcD48cD5TdWJqZWN0OiBbUEFUQ0hd
IGZpeCB2aG9zdF91c2VyX2dwdV9jaHJfcmVhZCgpIHdoZXJlIGBzaXplYCB3YXMgaW5jb3JyZWN0
bHk8L3A+PHA+Jm5ic3A7cGFzc2VkIHRvIGBtc2ctJmd0O2ZsYWdzYDwvcD48cD48YnI+PC9wPjxw
PlNpZ25lZC1vZmYtYnk6IEhhb3JhbiBaaGFuZyAmbHQ7d2gxc3BlckB6anUuZWR1LmNuJmd0Ozwv
cD48cD48YnI+PC9wPjxwPi0tLTwvcD48cD48YnI+PC9wPjxwPiZuYnNwO2h3L2Rpc3BsYXkvdmhv
c3QtdXNlci1ncHUuYyB8IDIgKy08L3A+PHA+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pPC9wPjxwPjxicj48L3A+PHA+ZGlmZiAtLWdpdCBhL2h3L2Rp
c3BsYXkvdmhvc3QtdXNlci1ncHUuYyBiL2h3L2Rpc3BsYXkvdmhvc3QtdXNlci1ncHUuYzwvcD48
cD48YnI+PC9wPjxwPmluZGV4IDYzYzY0ZGRkZTYuLmMwYzY2OTEwZjEgMTAwNjQ0PC9wPjxwPi0t
LSBhL2h3L2Rpc3BsYXkvdmhvc3QtdXNlci1ncHUuYzwvcD48cD4rKysgYi9ody9kaXNwbGF5L3Zo
b3N0LXVzZXItZ3B1LmM8L3A+PHA+QEAgLTM5MCw3ICszOTAsNyBAQCB2aG9zdF91c2VyX2dwdV9j
aHJfcmVhZCh2b2lkICpvcGFxdWUpPC9wPjxwPiZuYnNwOyAmbmJzcDsgJm5ic3A7fTwvcD48cD4m
bmJzcDs8L3A+PHA+Jm5ic3A7ICZuYnNwOyAmbmJzcDttc2ctJmd0O3JlcXVlc3QgPSByZXF1ZXN0
OzwvcD48cD4tJm5ic3A7ICZuYnNwOyBtc2ctJmd0O2ZsYWdzID0gc2l6ZTs8L3A+PHA+KyZuYnNw
OyAmbmJzcDsgbXNnLSZndDtmbGFncyA9IGZsYWdzOzwvcD48cD4mbmJzcDsgJm5ic3A7ICZuYnNw
O21zZy0mZ3Q7c2l6ZSA9IHNpemU7PC9wPjxwPiZuYnNwOzwvcD48cD4mbmJzcDsgJm5ic3A7ICZu
YnNwO2lmIChyZXF1ZXN0ID09IFZIT1NUX1VTRVJfR1BVX0NVUlNPUl9VUERBVEUgfHw8L3A+PHA+
LS0mbmJzcDs8L3A+PHA+Mi40My4wPC9wPjxwPjxicj48L3A+PC9kaXY+
------=_Part_291546_1426043346.1724120400002--


