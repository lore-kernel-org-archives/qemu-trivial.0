Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cSP-0002L5-MB
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:55:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSN-0002Ib-9H
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSM-00083r-F6
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:55:03 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cSK-00080T-Ew; Fri, 06 Oct 2017 19:55:00 -0400
Received: by mail-qk0-x241.google.com with SMTP id z12so9701918qkb.0;
	Fri, 06 Oct 2017 16:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=emUG2b4ULg5F7e9jN8IRLpYzrBPuTHK8wTyzKxPYH/8=;
	b=T+O7vVAWHcPzVVMID0+My53YVan82+I/GpVbRIHHcZ869VzdpATf8ezMCR/omFMoJu
	EB8HHxyLjwSYl+Ud/KthI8Ce9+1TGTV43FX5lcr4zsuS6xZYAnAcPW4fKl159oUFouWj
	KN/PRz1Wd7hEG0BXFrLaGvUehG5LKUUx+OpUHFQ/sbOi+RpgIcbK0pmLrEDMsUX5xkLu
	yHlZzL/CdErcSOH5UO6SIhEBCSOm+ZT/s303vbY0BzDcefSPfCAsD4TNs93XdbpK0jEv
	/pW6XOxpX79Y9GiE8P8a8Y+lqhdjv2PuX/5L7PQBnp/tE2KpUZR+IqP5/+iVRewmOZE0
	Kgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=emUG2b4ULg5F7e9jN8IRLpYzrBPuTHK8wTyzKxPYH/8=;
	b=JyNLNuUK/VxTaAY1TnhQIUAaNMkZg8S/Q+plWtYvs4aRhwMh0w5RTLGMYPbjTHmCjM
	GdOJKiMRo99tkAvX7dGuExHhZNZU5tLXF2U0a6/JQHiNl3jNniWm/rDmPEBxyUvseDVM
	S96cIq/z/OYT7r05qw/luc65nwMcvqOtKrL+lT3Mwt1lz+0w3KUPtuVzdyWCGt/FEIEE
	ffgTsKlA7/88cPcTfDPJf8JHDVUkW13JDZY8MyKl8x5ZEuKzJ99TuT0+jbVJNMi6HFdn
	63lV4IMra0uFnLMQL9Hg2WgXUDgdHLE+u4ZLkdddGoP4eZv+vXxoeVZfh9sGMTjRhner
	SqZg==
X-Gm-Message-State: AMCzsaVPeEQn+N2teBFwdUzZi/e2w/TxBPgcEyRi6Nb+mksi7K/Lbw45
	1s23agVUyItibndLJlPiY50=
X-Google-Smtp-Source: AOwi7QDocsCzq3qA9ETQ6TWXAl/mZrRUwfhuelNn5KytXRayT3Y80dIEY/gFQCziLaaaUk05aOl03A==
X-Received: by 10.55.140.68 with SMTP id o65mr731060qkd.293.1507334099847;
	Fri, 06 Oct 2017 16:54:59 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.54.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:54:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:50:10 -0300
Message-Id: <20171006235023.11952-76-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 75/88] decnumber: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:55:04 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 libdecnumber/decNumber.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 8c197023f4..2d13198730 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -4089,7 +4089,7 @@ static decNumber * decAddOp(decNumber *res, const decNumber *lhs,
       acc=accbuff;			/* assume use local buffer */
       if (need*sizeof(Unit)>sizeof(accbuff)) {
 	/* printf("malloc add %ld %ld\n", need, sizeof(accbuff)); */
-	allocacc=(Unit *)malloc(need*sizeof(Unit));
+	allocacc=g_new(uint16_t, need);
 	if (allocacc==NULL) {		/* hopeless -- abandon */
 	  *status|=DEC_Insufficient_storage;
 	  break;}
@@ -4452,7 +4452,7 @@ static decNumber * decDivideOp(decNumber *res,
     acclength=D2U(reqdigits+DECDPUN);	/* in Units */
     if (acclength*sizeof(Unit)>sizeof(accbuff)) {
       /* printf("malloc dvacc %ld units\n", acclength); */
-      allocacc=(Unit *)malloc(acclength*sizeof(Unit));
+      allocacc=g_new(uint16_t, acclength);
       if (allocacc==NULL) {		/* hopeless -- abandon */
 	*status|=DEC_Insufficient_storage;
 	break;}
@@ -4477,7 +4477,7 @@ static decNumber * decDivideOp(decNumber *res,
     if (!(op&DIVIDE)) var1units++;
     if ((var1units+1)*sizeof(Unit)>sizeof(varbuff)) {
       /* printf("malloc dvvar %ld units\n", var1units+1); */
-      varalloc=(Unit *)malloc((var1units+1)*sizeof(Unit));
+      varalloc=g_new(uint16_t, (var1units+1));
       if (varalloc==NULL) {		/* hopeless -- abandon */
 	*status|=DEC_Insufficient_storage;
 	break;}
@@ -6314,7 +6314,7 @@ static Int decUnitCompare(const Unit *a, Int alength,
   need+=2;
   acc=accbuff;				/* assume use local buffer */
   if (need*sizeof(Unit)>sizeof(accbuff)) {
-    allocacc=(Unit *)malloc(need*sizeof(Unit));
+    allocacc=g_new(uint16_t, need);
     if (allocacc==NULL) return BADINT;	/* hopeless -- abandon */
     acc=allocacc;
     }
-- 
2.14.2


