Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1UPc-0005HT-IP
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 06:08:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPX-0005BD-Hz
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1UPW-0002OX-SR
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 06:08:31 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50005)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1UPQ-0002Be-4M; Wed, 06 Mar 2019 06:08:24 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MmDAc-1hRiOd0R96-00iAIv; Wed, 06 Mar 2019 12:07:43 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Zhang Chen <zhangckid@gmail.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
	John Snow <jsnow@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-s390x@nongnu.org, Corey Minyard <minyard@acm.org>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>, Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed,  6 Mar 2019 12:07:11 +0100
Message-Id: <20190306110711.309-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
References: <20190306110711.309-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ON5ZP15R6OYg6VTcqclWhyvlSDa7ZXb7fi8pmRnWMfe+21rMKa7
	kK3YBDCnZrSW1Qel06ezhdzr9yWFI/Wl7i7ChTBxu4ZROr11eOEd6KeV10OyAei9iH1i6yD
	e1NvY/mTXIuj+fcEkY0efPBEw8FyE8YLNgl/hvWw47mOrCAC8BaaHwzM3D1vyzhyKOFd/Uw
	QOKwL9B0j2QFC5URxaTGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lnGteihNptM=:K1xmbRsqeZgjdyeI2f8zEg
	0ZEP6WafoiDpZ45BM5JWC9nSVzIRt4NH1wMIUGk1l4JKcGQUgbDBzn0urHLLaEjZVDkLRe9Ti
	gjFizHkKMmRfcvFgrrgASpeZOGG2B9NhkE1i0TPWuc+GdLJ9KYE0Bvevo8BxeyNcjACjNZjYL
	5nJTS38aAPfQtZftuYGY07aB3n9c5rTacACr1jnUCv+GvCpEx9w/GdPoLZySEc+XhxErGhssz
	igMHJKd9kCLuPqdVOYYsi0uiUFc5vZl5X2WzeLx1PmRRMGaY+1DQRKjpod4q8TtivZKnXM1jm
	7eNxkdG7tAuuhDiLI9xI3BmfFKpOqOYGptrR+webIxayKcxX9QqgbTXdOmYjvs04i90RoK/fc
	ASXiXN7rWPwS1fJQ2jmJCWmjKBGQ4kz40Fb9FCXaeaHbmXNa1J1XIXNS1NjxjZ/uF+ztE7j4M
	wZKtZrCDu2VORq2dErQY4sZMgR1Zw5NMC+GmOituzO8TAtEjAuRbdEgOUkfnjNE/bY1cU1/Yu
	DhzS8gJXdIJd7skQ4qn0d9YlfDHsGvVSBECMK3w14cgwKizRP+6PyB2ng0zB/REbiTmoJXWxg
	ivCF1K+YPHDg4SlvOc7OsYKU4ncRAcJq/Ai6ddjVLjaz3nUKuLjuzJ6TE/ViVDjCgyVpD227v
	lzzAKrLV0szDqxQXc7PHNSZJ/UHrUwphSDYh1CmPPq9eyw/UfsRsRdgmG/njzJW35nOoDqcIK
	SeZJMOq7KJNpK15R3TcB9pwWYsihHiqrMgxbUA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: [Qemu-trivial] [PULL 10/10] thunk: fix of malloc to g_new
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 11:08:32 -0000

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Note that since thunking occurs throughout the lifetime of the QEMU
instance, there is no matching 'free' to correct.

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <5310bd5d152fa36c1828a7cbd19fc893739d1609.camel@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 thunk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index d5d8645cd4f1..17f3d320bb8e 100644
--- a/thunk.c
+++ b/thunk.c
@@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     for(i = 0;i < 2; i++) {
         offset = 0;
         max_align = 1;
-        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
+        se->field_offsets[i] = g_new(int, nb_fields);
         type_ptr = se->field_types;
         for(j = 0;j < nb_fields; j++) {
             size = thunk_type_size(type_ptr, i);
-- 
2.20.1


