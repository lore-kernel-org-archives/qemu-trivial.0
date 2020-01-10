Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipqRC-0002Hq-DZ
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jan 2020 04:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR9-0002By-0h
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 04:18:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ipqR7-00056v-VS
 for qemu-trivial@nongnu.org; Fri, 10 Jan 2020 04:18:34 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2674 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ipqR4-0004dV-BV; Fri, 10 Jan 2020 04:18:30 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2417338EB152DB909AF2;
 Fri, 10 Jan 2020 17:18:26 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 Jan 2020 17:18:16 +0800
From: <pannengyuan@huawei.com>
To: <pbonzini@redhat.com>, <mdroth@linux.vnet.ibm.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Subject: [PATCH v2 1/2] vl: Don't mismatch g_strsplit()/g_free()
Date: Fri, 10 Jan 2020 17:17:09 +0800
Message-ID: <20200110091710.53424-2-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200110091710.53424-1-pannengyuan@huawei.com>
References: <20200110091710.53424-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
X-List-Received-Date: Fri, 10 Jan 2020 09:18:36 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

It's a mismatch between g_strsplit and g_free, it will cause a memory lea=
k as follow:

[root@localhost]# ./aarch64-softmmu/qemu-system-aarch64 -accel help
Accelerators supported in QEMU binary:
tcg
kvm
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D1207900=3D=3DERROR: LeakSanitizer: detected memory leaks

Direct leak of 8 byte(s) in 2 object(s) allocated from:
    #0 0xfffd700231cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31c=
b)
    #1 0xfffd6ec57163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
    #2 0xfffd6ec724d7 in g_strndup (/lib64/libglib-2.0.so.0+0x724d7)
    #3 0xfffd6ec73d3f in g_strsplit (/lib64/libglib-2.0.so.0+0x73d3f)
    #4 0xaaab66be5077 in main /mnt/sdc/qemu-master/qemu-4.2.0-rc0/vl.c:35=
17
    #5 0xfffd6e140b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #6 0xaaab66bf0f53  (./build/aarch64-softmmu/qemu-system-aarch64+0x8a0=
f53)

Direct leak of 2 byte(s) in 2 object(s) allocated from:
    #0 0xfffd700231cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31c=
b)
    #1 0xfffd6ec57163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
    #2 0xfffd6ec7243b in g_strdup (/lib64/libglib-2.0.so.0+0x7243b)
    #3 0xfffd6ec73e6f in g_strsplit (/lib64/libglib-2.0.so.0+0x73e6f)
    #4 0xaaab66be5077 in main /mnt/sdc/qemu-master/qemu-4.2.0-rc0/vl.c:35=
17
    #5 0xfffd6e140b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #6 0xaaab66bf0f53  (./build/aarch64-softmmu/qemu-system-aarch64+0x8a0=
f53)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Changes v2 to v1:
- fix another on in qga/main.c
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 86474a55c9..2fa5cb3b9a 100644
--- a/vl.c
+++ b/vl.c
@@ -3476,7 +3476,7 @@ int main(int argc, char **argv, char **envp)
                             gchar **optname =3D g_strsplit(typename,
                                                          ACCEL_CLASS_SUF=
FIX, 0);
                             printf("%s\n", optname[0]);
-                            g_free(optname);
+                            g_strfreev(optname);
                         }
                         g_free(typename);
                     }
--=20
2.21.0.windows.1



