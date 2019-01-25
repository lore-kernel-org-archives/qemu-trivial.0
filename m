Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn3CQ-0008V1-23
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 10:15:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn3CJ-0008Ik-84
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 10:15:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gn3CI-0007Lp-H3
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 10:15:11 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gn3CI-0007IX-Bl; Fri, 25 Jan 2019 10:15:10 -0500
Received: by mail-pl1-x643.google.com with SMTP id y1so4691818plp.9;
	Fri, 25 Jan 2019 07:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DUTtpH1SeOD5s02myZz0vzc0pr2TVyT61EIQV+M8Oq8=;
	b=qyt9q1+Qzf+ZYvhObRr45xZbToYxIKBlk+V98YmOXeFGfVwSaB5UZtAweliUgnDvvz
	4BUCjvELwath8EddxNEcY+/IRr8YxB4gEaTMYeROHjSElQln8RVCTiNfloZ9bqT3m9TH
	mkztH4JJtFQc0Hciu23CSrWKBHA0fVonfdhy2aexZcGOCZMVNYpfb8f9ps9DwFFIR1rB
	GqYFlBdFfRrYzE2xExw09TogH5Q8GDemnKyFPzoMFEG2f/eHavhlhb/7Lm9Y6VHeNu3J
	/796Dt7h5zdrOjQv2V4M3QTK9BbqtY7c/PyDTZholZjHKQXTuOwAPvGDkjU8wu8UPocf
	TaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DUTtpH1SeOD5s02myZz0vzc0pr2TVyT61EIQV+M8Oq8=;
	b=hmtIN4KNQcvn+sLnvDRsPoZZxz5bIn3NPSVNOlLnk10Iir3GzNJ8WaLZBSldELJjSM
	TeStpRDi7BHDULD0+9zN5FBPbiQL/NN1F/gJVgWIJsT0tyhBDMOZnnTVm9oZqke9534V
	1OZz0xgXYcsCo7lOfOuXctV42PRvJfz1ZIpGCToChCo2ntfifkh4EYlWwpPwQSarAOqp
	0QOh+cj+qK4tIFOqNY/I9HUTYU+XtLF5z6tR6jMeT9+r2t7YKnGJ7L3JsurdoyVO84CA
	AxTzEeCosqfpralBMJXdI9ase5Svr2jctxcd+El8Dl18zFr8uVtHjwwk9rz2gaAXC2eT
	ElIg==
X-Gm-Message-State: AJcUukemZF2xBRnemj7n6x4xpSzTlmU5tpWw2BsvQEL74hE5tjYNOQXp
	FYZ4EcQw2wia3HRMebc4CkGmh+4tMPI=
X-Google-Smtp-Source: ALg8bN4aM4vXsErLhzccRXPbduzdOaTnqHxCB+dDpB7I+XItc1rIt/pYGJjjSp8VnIcdObZ/EV1JTA==
X-Received: by 2002:a17:902:4:: with SMTP id 4mr11489606pla.20.1548429308068; 
	Fri, 25 Jan 2019 07:15:08 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	q199sm46786642pfc.97.2019.01.25.07.15.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 07:15:07 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Cc: mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
	thuth@redhat.com
Date: Fri, 25 Jan 2019 20:44:40 +0530
Message-Id: <20190125151440.13794-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-trivial] [PATCH] hw: input: set category of the i8042 device
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
X-List-Received-Date: Fri, 25 Jan 2019 15:15:16 -0000

Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
Devices should be assigned to one of DEVICE_CATEGORY_XXXX.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/input/pckbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 3e66713b47..72e7d5f6cc 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
 
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo i8042_info = {
-- 
2.17.1


