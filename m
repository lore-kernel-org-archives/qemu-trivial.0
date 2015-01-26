Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFhbQ-0005RV-Gz
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jan 2015 06:13:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbO-0005N2-8Z
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:13:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YFhbK-0001sQ-RA
	for qemu-trivial@nongnu.org; Mon, 26 Jan 2015 06:13:05 -0500
Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b]:50351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YFhb2-0001iO-2k; Mon, 26 Jan 2015 06:12:44 -0500
Received: by mail-we0-f171.google.com with SMTP id k11so6056084wes.2;
	Mon, 26 Jan 2015 03:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CAFMqQD8rtBCYUA0SEpWuLBNwtx9Kw09rnTZcTsSCzs=;
	b=ireN0fEVoRkgDCqOO0C1akyPDHi/9H06RCcO1xeSZdRzPzEzkJS+bf1KSSPrSiCAJb
	20W9NqcHfhobIP9vQKGo135eLPBzR0kbF0a+5fuENgaPJz6TAMoh4zYeWV5LJFZVE5Tq
	8ceQ92vSpMP98SZJ8SSLFMOWp/pIRtpjIrbJhMDDEhnpocRmLOIXwq1roGqN9LHgMfKl
	TJvkbUU0BuQ8Kv18dYhjC2DlcElExf2FPyvXIN1AdxSnKql0xhPtmAZw3+EWwTmEYbgf
	kR12fHko6jLUeoHDrVVj1WR4/kbb/gLJme3P3OtNlhGZrtGKof07MSHnVuaQogQtlsBW
	PfRA==
X-Received: by 10.194.60.77 with SMTP id f13mr21804124wjr.105.1422270763543;
	Mon, 26 Jan 2015 03:12:43 -0800 (PST)
Received: from playground.station (net-2-35-193-154.cust.vodafonedsl.it.
	[2.35.193.154])
	by mx.google.com with ESMTPSA id fp2sm13476390wib.8.2015.01.26.03.12.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 03:12:42 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Jan 2015 12:12:26 +0100
Message-Id: <1422270747-23994-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
References: <1422270747-23994-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22b
Cc: qemu-trivial@nongnu.org, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 6/7] aes: remove a dead return statement
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
X-List-Received-Date: Mon, 26 Jan 2015 11:13:07 -0000

bits is checked to be 128, 192 or 256 at the beginning of the function.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/aes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/aes.c b/util/aes.c
index 6058f19..f42126a 100644
--- a/util/aes.c
+++ b/util/aes.c
@@ -1161,7 +1161,7 @@ int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
 			rk += 8;
         	}
 	}
-	return 0;
+	abort();
 }
 
 /**
-- 
1.8.3.1



