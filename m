Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XdhpC-0001zE-Oq
	for mharc-qemu-trivial@gnu.org; Mon, 13 Oct 2014 11:46:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xdhp1-0001uj-M7
	for qemu-trivial@nongnu.org; Mon, 13 Oct 2014 11:46:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xdhos-0000D3-Gv
	for qemu-trivial@nongnu.org; Mon, 13 Oct 2014 11:46:07 -0400
Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233]:35146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Xdhos-0000Cw-9U; Mon, 13 Oct 2014 11:45:58 -0400
Received: by mail-pd0-f179.google.com with SMTP id r10so5800004pdi.38
	for <multiple recipients>; Mon, 13 Oct 2014 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aZ3wKs86fDes2Z2/KOxSAUgCZoksFGR4YRb1sEsn3Ko=;
	b=BD03lZXnc1+FtB8MAOTfRfBGVj3H0tB9FGZljhcZCSw2sJwgPxKd9eXu3DVNpKCmIf
	l9SJea/LcJgSPml5/klwhZakOEIu9F6PNMQhVkbmP9mhjANsCnxtVo2u/2jlK5532RNZ
	OSIY5r7tUYAxkIgjLPF9katM/wO8A0qdoI2noBO+8/0VX4SoIYJuUz/Fx7wyfSxKEP9O
	jVkSW6Vh7KHxeEtVvD0Sltg1CXs+6gcjosjpciK9Dhg5/TXU3t+JYmw2stBVwxEVLwDC
	esWrYXSLgm2gZCAh4u2hoBl2FOafgIHve70eEt+c5NAjvaMBiOkeeEfJdkMiGGO2uf2t
	6HDQ==
X-Received: by 10.68.57.226 with SMTP id l2mr2582510pbq.147.1413214671986;
	Mon, 13 Oct 2014 08:37:51 -0700 (PDT)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([223.72.65.118])
	by mx.google.com with ESMTPSA id
	np11sm11534068pdb.78.2014.10.13.08.37.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 08:37:50 -0700 (PDT)
Message-ID: <543BF32F.4020205@gmail.com>
Date: Mon, 13 Oct 2014 23:43:43 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>, pbonzini@redhat.com
References: <543BE352.3080609@gmail.com> <543BE616.1000707@suse.de>
In-Reply-To: <543BE616.1000707@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::233
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: kvm: Fix memory overflow
	issue about strncat()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Oct 2014 15:46:16 -0000

On 10/13/14 22:47, Alexander Graf wrote:
> 
> Could you please instead rewrite it to use g_strdup_printf() rather than
> strncat()s? That way we resolve all string pitfalls automatically - and
> this code is not the fast path, so doing an extra memory allocation is ok.
>

I guess, it is a personal taste. For me, it may need additional variable
for g_strdup_printf(), and not save code lines, but *sprintf() is more
readable than str*cat().

The related code may like below (welcome any improvement for it):

diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 66e7ce5..cea6a87 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -1782,7 +1782,7 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
  * format) */
 static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
 {
-    char buf[PATH_MAX];
+    char buf[PATH_MAX], *tmp;
     union {
         uint32_t v32;
         uint64_t v64;
@@ -1794,10 +1794,10 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
         return -1;
     }
 
-    strncat(buf, "/", sizeof(buf) - strlen(buf) - 1);
-    strncat(buf, propname, sizeof(buf) - strlen(buf) - 1);
+    tmp = g_strdup_printf("%s/%s", buf, propname);
 
-    f = fopen(buf, "rb");
+    f = fopen(tmp, "rb");
+    g_free(buf);
     if (!f) {
         return -1;
     }

For me, it is really a personal taste, so if the maintainer feels the
diff above is OK, I shall send patch v2 for it within 2 days.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

