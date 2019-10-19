Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLxEJ-0007Kp-8k
	for mharc-qemu-trivial@gnu.org; Sat, 19 Oct 2019 18:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58922)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1iLxEG-0007Ii-AY
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 18:29:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1iLxEF-0005Jz-1L
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 18:29:44 -0400
Resent-Date: Sat, 19 Oct 2019 18:29:44 -0400
Resent-Message-Id: <E1iLxEF-0005Jz-1L@eggs.gnu.org>
Received: from sender4-of-o54.zoho.com ([136.143.188.54]:21432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1iLxEB-0005HI-U5; Sat, 19 Oct 2019 18:29:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571524155; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LEqnfpZmXcVNtr0DbffUECqaAV2xOUhxGkQUQ+Z76mQ7ANZFFB6LxINvKvXWoTeCFKTV+Q2C3VsV+calrMyFQM2+q+on2+rsEmZQys4ng+90Ubn7EfbcU7iHvOjRK1yXztTy3bB2BPuSoO1JzaKKMYAmqgB7Rn9WPkjEFTaxf4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1571524155;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=KntkT2pXd8PWpcjJErkspS/55HinzpvkLAqVuF+UpaM=; 
 b=e5vPCCpvWkmkOj181VnI3h8QUMKqdiGrwU8BrZtQDUvK9LVPd2iWoudZrYikJz4tagmmoRZfGRA6Toy7/4FUEjp309B3xll2GHjW2p0OUvRsppkWrXeeAhS2LnJHYFRD92Amw9Hk+3PouypHNv99a56EuG4VGWX6z9WiVKnJ5i4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 157152415376265.17164592501274;
 Sat, 19 Oct 2019 15:29:13 -0700 (PDT)
In-Reply-To: <20191019120534.27479-1-ash@kambanaria.org>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/1] Update Bulgarian translation
Message-ID: <157152415144.24734.16743337712381592547@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: ash@kambanaria.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, aliguori@us.ibm.com,
 famz@redhat.com, wehuang@redhat.com, ptoscano@redhat.com,
 qemu-trivial@nongnu.org, lersek@redhat.com, ash@kambanaria.org,
 laurent@vivier.eu, f4bug@amsat.org, borntraeger@de.ibm.com,
 stefanha@redhat.com, sw@weilnetz.de, thuth@redhat.com, pbonzini@redhat.com,
 akong@redhat.com, songdongsheng@live.cn
Date: Sat, 19 Oct 2019 15:29:13 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.54
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Oct 2019 22:29:45 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MTAxOTEyMDUzNC4yNzQ3
OS0xLWFzaEBrYW1iYW5hcmlhLm9yZy8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhlIGRv
Y2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNv
bW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxs
ZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0xIE5F
VFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0xIEo9
MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIFRFU1QgICAgaW90ZXN0LXFj
b3cyOiAwMTAKICBURVNUICAgIGNoZWNrLXF0ZXN0LXg4Nl82NDogdGVzdHMvYWhjaS10ZXN0CnRl
c3QtYWlvLW11bHRpdGhyZWFkOiAvdG1wL3FlbXUtdGVzdC9zcmMvdXRpbC9hc3luYy5jOjI4Mzog
YWlvX2N0eF9maW5hbGl6ZTogQXNzZXJ0aW9uIGAhcWVtdV9sb2NrY250X2NvdW50KCZjdHgtPmxp
c3RfbG9jayknIGZhaWxlZC4KRVJST1IgLSB0b28gZmV3IHRlc3RzIHJ1biAoZXhwZWN0ZWQgNiwg
Z290IDIpCm1ha2U6ICoqKiBbY2hlY2stdW5pdF0gRXJyb3IgMQptYWtlOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLgogIFRFU1QgICAgaW90ZXN0LXFjb3cyOiAwMTEKICBURVNU
ICAgIGlvdGVzdC1xY293MjogMDEyCi0tLQogICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJl
dGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6IENvbW1hbmQgJ1snc3Vk
bycsICctbicsICdkb2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29tLnFlbXUuaW5zdGFuY2Uu
dXVpZD0zMTM1Mjc3ZGY2ZGU0NTRkODhiZjZjMDk1OTkwNzkxYicsICctdScsICcxMDAxJywgJy0t
c2VjdXJpdHktb3B0JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJtJywgJy1lJywgJ1RBUkdF
VF9MSVNUPScsICctZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAnLWUnLCAnVj0nLCAnLWUn
LCAnSj0xNCcsICctZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9MScsICctZScsICdDQ0FD
SEVfRElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRjaGV3Ly5jYWNoZS9xZW11
LWRvY2tlci1jY2FjaGU6L3Zhci90bXAvY2NhY2hlOnonLCAnLXYnLCAnL3Zhci90bXAvcGF0Y2hl
dy10ZXN0ZXItdG1wLXpqOXJsdHZsL3NyYy9kb2NrZXItc3JjLjIwMTktMTAtMTktMTguMTcuMzQu
MjU2OTI6L3Zhci90bXAvcWVtdTp6LHJvJywgJ3FlbXU6Y2VudG9zNycsICcvdmFyL3RtcC9xZW11
L3J1bicsICd0ZXN0LXF1aWNrJ10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIuCmZp
bHRlcj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPTMxMzUyNzdkZjZkZTQ1
NGQ4OGJmNmMwOTU5OTA3OTFiCm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQptYWtl
WzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLXpqOXJs
dHZsL3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtcXVpY2tAY2VudG9zN10gRXJyb3Ig
MgoKcmVhbCAgICAxMW0zNy4zOThzCnVzZXIgICAgMG05LjgxMXMKCgpUaGUgZnVsbCBsb2cgaXMg
YXZhaWxhYmxlIGF0Cmh0dHA6Ly9wYXRjaGV3Lm9yZy9sb2dzLzIwMTkxMDE5MTIwNTM0LjI3NDc5
LTEtYXNoQGthbWJhbmFyaWEub3JnL3Rlc3RpbmcuZG9ja2VyLXF1aWNrQGNlbnRvczcvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0byBwYXRjaGV3
LWRldmVsQHJlZGhhdC5jb20=


