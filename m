Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUnJw-0005Zz-VV
	for mharc-qemu-trivial@gnu.org; Mon, 27 Sep 2021 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJs-0005PG-4N; Mon, 27 Sep 2021 05:53:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mUnJq-0004LX-KZ; Mon, 27 Sep 2021 05:53:07 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N1wdd-1mx5pT1pLF-012Cxv; Mon, 27
 Sep 2021 11:52:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Dongli Zhang <dongli.zhang@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>
Subject: [PULL 5/5] multi-process: fix usage information
Date: Mon, 27 Sep 2021 11:52:52 +0200
Message-Id: <20210927095252.2374148-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
References: <20210927095252.2374148-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6H3d7WucMd+KMwnJ1O5k1VRj3goltmlZT9rKXNUV5/nB5kxsj7h
 YL5QK0wW2EQWWVzSGgE+Hj564VNhLK/PqTY8rrXI4D0+dpSA7aGlGlnvOybgTaj3LfbaOGH
 qWs72ht81TTbQ/EsNRjYfeTReKUvF9dmNC8iZLo8ecO1BmF52CGHcLImnMofNwR7ise+2MN
 GRRE/d3cIa8XqxjHKLY7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kqndfpXd6OA=:z9wYv7hjiV6CFYG+tAmzqp
 /73k4Ie/ji2qkauGtD31T3HNiWYT/7ejN1aB+ap0mJhPWCLAQGVSPDhSNyAs0a6oAaPg8xZmm
 ZKh4m4K2vlY8OTHush5WzoAAkUyWvpyGD25DS2aDM+SPiQMMgP0IArrE+WrgKC8HkyAAWJO1j
 6JeD+zgd5IrbqoaqoglaZ6udd1NKEQi/lTPdItOXjVh9BGM8kdtCaVWp1y5EU2EQWdQ8NKAcn
 z7I3w1iAInWwm0gDi04rF2/h4ep2VjYu7SDJ2nlETQjaFQ0TiCle+i6jJrQeLky8Ni1lY01dp
 19haYJCwAawVn3ePhfirVXJmJ1No2KsqfzSdrs+Snx8hHnYvixs+pdqVuiaUtIZ8Ra7ef3JlY
 6SfNSgz2DtC+53aGK4Af59wwczvLVmoRApbk/65bvannYeEGVBUpi6DcZr1Cr7tFJU/dLH4Da
 QPSZASCBnuqcpD/e0MPy4UtWvCS93sQHKxkGiTYEiU6SSWB3DwbZ7M3xRL+4Nzxhai2v84EB+
 v1rBlPI8gVRWkke3CxIJsvJxVAjo6jO07isNBiRi5qjATU75UL8b06arOfJO7H8cIpHkFJ//m
 D/YIoxeyGeT25i4O3i1pVMeFO9TBucyVPcEo58DAWs/skQh0Zhe+hoOKPIZLCZpA7XLlk26So
 lpR2v4V9g9uPkHNVSusTTyOqFNnWUst5WEtBH5EGf6NjnJmA4SZxNj7dABBb6i8Ni7PStND62
 0lyhUms+2jt/K8Jt13Ux1suOKuM+RNWJ3b+vgw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 27 Sep 2021 09:53:08 -0000

From: Dongli Zhang <dongli.zhang@oracle.com>

From source code, the 'devid' of x-remote-object should be one of devices
in remote QEMU process.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210713004718.20381-1-dongli.zhang@oracle.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/system/multi-process.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
index 46bb0cafc27a..210531ee17df 100644
--- a/docs/system/multi-process.rst
+++ b/docs/system/multi-process.rst
@@ -45,7 +45,7 @@ Following is a description of command-line used to launch mpqemu.
       -device lsi53c895a,id=lsi0                                         \
       -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
       -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
-      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+      -object x-remote-object,id=robj1,devid=lsi0,fd=4,
 
 * QEMU:
 
-- 
2.31.1


