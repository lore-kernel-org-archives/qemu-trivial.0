Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eLKm9-0006tG-N3
	for mharc-qemu-trivial@gnu.org; Sat, 02 Dec 2017 22:17:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shravan2x@utexas.edu>) id 1eLGQt-0003sD-20
	for qemu-trivial@nongnu.org; Sat, 02 Dec 2017 17:38:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shravan2x@utexas.edu>) id 1eLGQp-0001np-U3
	for qemu-trivial@nongnu.org; Sat, 02 Dec 2017 17:38:51 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:45207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shravan2x@utexas.edu>)
	id 1eLGQp-0001nb-Pn
	for qemu-trivial@nongnu.org; Sat, 02 Dec 2017 17:38:47 -0500
Received: by mail-ot0-x242.google.com with SMTP id j64so11884941otj.12
	for <qemu-trivial@nongnu.org>; Sat, 02 Dec 2017 14:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=utexas-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YAz5vapA0rJqPoZ9GrCBO9Ehw2iYfrqzLf2Qc3FhDCw=;
	b=g9mPEyswOFcFNFyX7BUcy+ufmygZRB/WslIW+Hb9cp8bZLl2bReYmEBRAKF0kEE9Nj
	Nqr1X3RAOpB6xFpugv1HtNrUEnSBrBpIp/r6ztOSMt/gOPDRdJ0UmsqyrCO1797UDzK5
	CtZOzW/64KiGbLtAXsga41UIfsH9bQb+iOuLXnO6aB+qZBUrYBGajxh2ln6OSFV8KRL1
	x1xxZkFxQFGX8DvwVgzMhuy9vwvy3F+r5H/GLjeLtZfPxzlB5WoLivHY0EJgZVwGU45l
	utYpUicLHICAWDD6+zC1Daos9rwg+9ORwkq8WCkqTQtqvzVXstixCYVniel/lMp848W9
	y5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YAz5vapA0rJqPoZ9GrCBO9Ehw2iYfrqzLf2Qc3FhDCw=;
	b=eLF4hUFJN0KxYaW8Ybo4T3frq9qHmUQJf4jmwrE+ETlrCf9+8cRE/8UEL3k+NvBvG/
	xEveB+2V7JyRmECnEWeqBJ2w2cpXbg6NHPDoK2NqBGbhjx9/OHyMQz03Hn6E1XZnQs6o
	8wIN4um+sMcPNeOiAI1FF6MgfoVYNLFMdf/Rbyjpa8pWdRPghkHqyBUrWS8So0gjXuuK
	JfT+RDcDzwNix+quNmrL0i6CvJ0vHb+J1SkCBWGDhRPTk9S7shlFFjh/EhVeSU7dqzhd
	Q4xGRksXpQsDniTqepBKlXwG1L0zFh5U+0E1EteMV+0lNV+OmN/VVdJcs4eRBokC/9w4
	zKJA==
X-Gm-Message-State: AJaThX7MLPaDweEnds5uDCu+ixdr8VHhbIR9PITNRlC0bS3lT4mqLbLi
	zpSgVGNy9DryAuj4dl9KKrkC1w==
X-Google-Smtp-Source: AGs4zMbpy8j3CRl7uEG8SSuj4hure3Mjk2cXn7VovQ+PDdFF2Nw+clvx/SOP0UUHJvFQRJmh7+N1vw==
X-Received: by 10.157.54.235 with SMTP id s40mr11044399otd.397.1512254326969; 
	Sat, 02 Dec 2017 14:38:46 -0800 (PST)
Received: from ubuntu.localdomain (cpe-72-182-52-135.austin.res.rr.com.
	[72.182.52.135]) by smtp.gmail.com with ESMTPSA id
	y126sm4167901oia.39.2017.12.02.14.38.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 02 Dec 2017 14:38:46 -0800 (PST)
From: Shravan Rajinikanth <shravan2x@utexas.edu>
To: qemu-devel@nongnu.org
Cc: Shravan Rajinikanth <shravan2x@utexas.edu>,
	qemu-trivial@nongnu.org
Date: Sat,  2 Dec 2017 14:37:53 -0800
Message-Id: <1512254273-7567-1-git-send-email-shravan2x@utexas.edu>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
X-Mailman-Approved-At: Sat, 02 Dec 2017 22:17:04 -0500
Subject: [Qemu-trivial] [PATCH] qemu-img: Fixed grammatical error in
 dump_human_image_check
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
X-List-Received-Date: Sat, 02 Dec 2017 22:38:52 -0000

Signed-off-by: Shravan Rajinikanth <shravan2x@utexas.edu>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index 68b375f..bea9268 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -580,7 +580,7 @@ static void dump_human_image_check(ImageCheck *check, bool quiet)
         if (check->leaks) {
             qprintf(quiet,
                     "\n%" PRId64 " leaked clusters were found on the image.\n"
-                    "This means waste of disk space, but no harm to data.\n",
+                    "This means disk space is wasted, but data is safe.\n",
                     check->leaks);
         }
 
-- 
2.7.4


