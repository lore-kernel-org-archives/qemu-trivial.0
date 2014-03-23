Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRiHp-0004XQ-1M
	for mharc-qemu-trivial@gnu.org; Sun, 23 Mar 2014 09:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReiq-0002OE-Ad
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReih-0003sG-UJ
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:40 -0400
Received: from mail-pb0-x235.google.com ([2607:f8b0:400e:c01::235]:41826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WReiJ-0003lL-UU; Sun, 23 Mar 2014 05:29:08 -0400
Received: by mail-pb0-f53.google.com with SMTP id rp16so4163941pbb.26
	for <multiple recipients>; Sun, 23 Mar 2014 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5hF4Iamh7UBtl1rNDRkd2pXA+vsUAQkEdEcJJgGRqaw=;
	b=UChAcDRXSamqReUkDbm9OM9FPBefOKQb4TEaZSIWC4MYTPVknXpLXLrH9U2F1Bkjbh
	mqHVNWPoxFcbdx5wbU6Bb6O0cIzKAK8r6Tm/saxj7ytfP0a7izSzXMFBwy6WV8zK4HcE
	xmLNQg8b0qairBur+1bJL28eBq8KvksXcbugqp4/jQPDd8OEypH1iMVEbwqVpH8O9zJF
	jtw/q/iBCm3nXGqSOxSaSgIJQyrniU9jekWdvmMJOBIbp6NE8uPp0q8ZZrAQhO2tIM9K
	h5TrzARFZ1wa//zShlzT3ZRHiw0pYCMek4lkvOcCoTuwaHKhVrMFuNxls2ZWHMtuIrCh
	h6Aw==
X-Received: by 10.68.179.98 with SMTP id df2mr63863247pbc.51.1395566947074;
	Sun, 23 Mar 2014 02:29:07 -0700 (PDT)
Received: from prasad-desktop ([117.195.29.155])
	by mx.google.com with ESMTPSA id
	gu11sm21073985pbd.74.2014.03.23.02.28.59 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 02:29:05 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 934FCA00603; Sun, 23 Mar 2014 14:58:50 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Sun, 23 Mar 2014 14:58:40 +0530
Message-Id: <1395566923-5074-3-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::235
X-Mailman-Approved-At: Sun, 23 Mar 2014 09:17:59 -0400
Cc: peter.maydell@linaro.org, stefanha@redhat.com, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH 3/6] pcnet: remove duplicate assignment
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
X-List-Received-Date: Sun, 23 Mar 2014 09:29:48 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 hw/net/pcnet.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
index 7cb47b3..ebe5057 100644
--- a/hw/net/pcnet.c
+++ b/hw/net/pcnet.c
@@ -718,7 +718,6 @@ static void pcnet_s_reset(PCNetState *s)
     s->csr[94]  = 0x0000;
     s->csr[100] = 0x0200;
     s->csr[103] = 0x0105;
-    s->csr[103] = 0x0105;
     s->csr[112] = 0x0000;
     s->csr[114] = 0x0000;
     s->csr[122] = 0x0000;
-- 
1.8.1.2


