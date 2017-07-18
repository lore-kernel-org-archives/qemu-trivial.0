Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsU-0001gn-Tu
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsS-0001em-OR
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsR-0000lv-VA
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:00 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35365)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsR-0000lG-Qy; Tue, 18 Jul 2017 02:20:59 -0400
Received: by mail-qk0-x244.google.com with SMTP id z22so1358722qka.2;
	Mon, 17 Jul 2017 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9KOoM2OeoDoWb1aE2NHWvN+NypfQFv8yKFZANDTIiPI=;
	b=HDs+UOU2+Aq3mAcFmgLNAqpNJjCqeR6Xgulnxa2pYFOKuZd2FLHZBJerx6UoXG0zFi
	zOhxtTQOAz4S+5mYsKN+aUzVOaL5C2/BCrTWvzZHMMvdYS19dOTP7/LOZ4IBHCL7yYYw
	83is2BAhMAT+mI634+Izv3xfK0OyRspEqfNecwkFs+tEKWtqBRD7OPBYRq/r5ZVsyONq
	RqMmRlc6JubD0nZfShXiQf5CN10h45oBOt0CJPNKgYFAkKwYlToo0ZuGK4WZk/HmzA0v
	w2wxJRmhKwKIABRTW5GY240K6yJzniLvzchCy5NdMeM+9egg+AvK+y4xxGCyMr1dTqfe
	4qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9KOoM2OeoDoWb1aE2NHWvN+NypfQFv8yKFZANDTIiPI=;
	b=Idl94cvaflbOWDfxg7EOLdg2JoEGaRMMfG9PV6p65aXw1MvJhvxiQDYHSJUHL8SeR4
	bF3+RjqE/ZHojQBDU8/MSJ9wWAcaH1H3ZJpQ6BKDaHsCetavnLRApw4qXRxsXItmu5h6
	MSqrwTHmmD6xGotkwwiyhdNh2CoMNEmEIRcvKyuznaM746UV5bZ31ShP/7cB0J1gUKKc
	ajfvddBEwD2MsKoZtu8k0eEShNxQYUP+ggxiYEJ9EJ0KxTZfjrLOJ8KgAV4kazLrLbfd
	HUoK0J7wqV7D+xuYz0aciLGuT9pPRW8bRGX5AQjxopbSPsNdo2nugG5wWVrIdly9672i
	Oy8A==
X-Gm-Message-State: AIVw112UYu1QzgCx5cKyn9uui6HM8h5+p8ayzxPcD8MoJjhy/85D9W7x
	jTLIT07JBiYATLJaNxSJVg==
X-Received: by 10.55.43.144 with SMTP id r16mr56811qkr.59.1500358859228;
	Mon, 17 Jul 2017 23:20:59 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:20:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:47 -0300
Message-Id: <20170718061005.29518-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 11/29] s390x/sclp: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:02 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/s390x/sclp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 9253dbbc64..0a207c7345 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -237,7 +237,7 @@ static void assign_storage(SCLPDevice *sclp, SCCB *sccb)
     }
     assign_addr = (assign_info->rn - 1) * mhd->rzm;
 
-    if ((assign_addr % MEM_SECTION_SIZE == 0) &&
+    if (QEMU_IS_ALIGNED(assign_addr, MEM_SECTION_SIZE) &&
         (assign_addr >= mhd->padded_ram_size)) {
         /* Re-use existing memory region if found */
         mr = memory_region_find(sysmem, assign_addr, 1).mr;
@@ -297,7 +297,7 @@ static void unassign_storage(SCLPDevice *sclp, SCCB *sccb)
     unassign_addr = (assign_info->rn - 1) * mhd->rzm;
 
     /* if the addr is a multiple of 256 MB */
-    if ((unassign_addr % MEM_SECTION_SIZE == 0) &&
+    if (QEMU_IS_ALIGNED(unassign_addr, MEM_SECTION_SIZE) &&
         (unassign_addr >= mhd->padded_ram_size)) {
         mhd->standby_state_map[(unassign_addr -
                            mhd->padded_ram_size) / MEM_SECTION_SIZE] = 0;
-- 
2.13.2


