Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6ee-0004bz-1P
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 11:58:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eb-0004Zi-Ju
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eZ-0005Al-2X
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 11:58:45 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:41713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6eY-0005AS-US; Thu, 05 Jul 2018 11:58:43 -0400
Received: by mail-qt0-x229.google.com with SMTP id y20-v6so7514318qto.8;
	Thu, 05 Jul 2018 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nliH/EX0aglHIk/Fm4qYSToW9q6u0Iktv2X5oO8SSFQ=;
	b=D9L8FTvZ2/QbSUCGO28QkTtKKOaHqh5CzBCj5kOL5canY+mWLqaDX/1RBwMKmSUPSa
	Y/5vRLaqmrnxsZX1oJN8dMn6AgXU/Oox1R+6JibzR65V0ka68ls/UOi7lw4pbGOGsRoQ
	wMtRvkehsQyW9tHh11oaE17GKnt6lZxbxOO3J5yCwHg92ZllLjpVdqUohIkpG2IrpnOk
	hFHj3c15HSpoZCE+1oywlqsGoT+i7bqopiyNeFK3HFjEHDqXKQ1jSy6R4B8rJld+M4OH
	DPIJwc26fwfFpJC2pObk/CbMce4Md+unFbCO+KllJTPYRIiKOaRPqmkKT5k9OZyRD+x7
	K7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nliH/EX0aglHIk/Fm4qYSToW9q6u0Iktv2X5oO8SSFQ=;
	b=MJhhfeX/OOPF8CLkkg7Hy3+q6Z0tGxFLA2qdR4PL2e8VKjSKA86Et1/KPEzNY3FKiU
	zg7Nk20lHUhv4tg2tCPQLn66X/ajekNq286nZdxOWdadzQnCVPB/UosYZzvt+GTqSihn
	o6pizavARCwD/pQKyfEk8IdU7H1e+M3fPZ0NjlCFJTPJKyv5wx7p/5yAue9S7VLFqyyU
	FJgWhgONj8vII3/KsZpjsIT/0FvFvO0ZxquK9UrpVbNavFMP6l00/mpY7JJlz9iQ6sgy
	VThdjHhTzz1OwTX+ZNnPmxmpXYHFGRvWXUiCrSv4WXNDU0pxMITHSq46KK72NaWH3sdx
	UEGQ==
X-Gm-Message-State: APt69E2x1QAC83WLPHBRbOGerdcARdBvQXkVIz1W+KwVjOp2pq3YDBot
	yfMxFrD6B/LQW2V/jHto/6+uZ9/R
X-Google-Smtp-Source: AAOMgpcIpgwMhuHk9OU/0ErLO218h/eNHe0PwhrHOHOvNMu4bw5B0q2H9xrr5G3CjujAhij3yYYwgw==
X-Received: by 2002:ac8:3274:: with SMTP id
	y49-v6mr5837266qta.194.1530806322099; 
	Thu, 05 Jul 2018 08:58:42 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	k66-v6sm4049403qkc.86.2018.07.05.08.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 08:58:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM cores)
Date: Thu,  5 Jul 2018 12:58:11 -0300
Message-Id: <20180705155811.20366-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705155811.20366-1-f4bug@amsat.org>
References: <20180705155811.20366-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-trivial] [PATCH v2 7/7] hw/intc/gicv3: Remove useless
 parenthesis around DIV_ROUND_UP macro
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
X-List-Received-Date: Thu, 05 Jul 2018 15:58:46 -0000

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/intc/arm_gicv3_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b798486ecf..31ec9a1ae4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -62,7 +62,7 @@
  * avoids bugs where we forget to subtract GIC_INTERNAL from an
  * interrupt number.
  */
-#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+#define GICV3_BMP_SIZE DIV_ROUND_UP(GICV3_MAXIRQ, 32)
 
 #define GIC_DECLARE_BITMAP(name) \
     uint32_t name[GICV3_BMP_SIZE]
-- 
2.18.0


