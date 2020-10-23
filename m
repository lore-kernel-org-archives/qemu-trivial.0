Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVwOo-0001Rp-Ad
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2020 08:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1kVwOm-0001O8-ML; Fri, 23 Oct 2020 08:42:24 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1kVwOi-0004NO-Ex; Fri, 23 Oct 2020 08:42:24 -0400
Received: by mail-pf1-x443.google.com with SMTP id c20so1143854pfr.8;
 Fri, 23 Oct 2020 05:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JNQ+gmzxbuIn34M0VRwTLJO0XNoE7EW69GDWhOy9j7k=;
 b=gC+iIczjM+BEPL3ptzhyqKh6R190TUa3bs8rgd/Gr9O32KD5BOVgKBObdDbq7M6gWG
 2LBxIoV/YTL0tQStO2gPfAZf5xMqmhnwEPD1Jt/oBB0sr7u6xRLrNRf1kDfeQydsE2m6
 6UbkiknDWDGYDo36N9yv+o8nfVUQe0epE5jQfWeKFF3uojaXfN3zTGxMn7fj26h6TGK8
 pBUN++iq98aKBpoTYK3bN9fkHRRpr6A7TWNg4sbZXJnw5lLrQs4JHmlkcBHGgBdU6i4O
 +UzoMMlp1o7Ggc9Cfmu8IbKEXt+flZMh+c8any2/cAinG10NWBxoPvQzIo16JUA29PsM
 Bt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JNQ+gmzxbuIn34M0VRwTLJO0XNoE7EW69GDWhOy9j7k=;
 b=aVcwFg3C+3iKYp8Opae8QtKQScB3QrTn6lhIOGElckTr2apmRq1QD1cIVDveSJGVCK
 y3OAikWvWQojWW861Swn/Qqi0858u5UuvXEmCYrZM//T+Z61i7/Oy/CzJt+5BUB3amY9
 Uvwi1PiEEgTIHo+72vsU57u0sgq7cVvzP8i60sN5JdaN7lDVf/Y3RxweoMTkqeM+iWXC
 AYWq1ncAhzR74BOd5af96H98R2m2aWs9gVtGaZcjSfHALtJpNgGIRFP8ISxE5gMAySCw
 N3eMgVyHROGZsendKug78UhXhq3omTqnbhnZPuNrrn/OY3Zwkb067VxHxMEA5aGnriXS
 Zqzg==
X-Gm-Message-State: AOAM5312t2KygREcXXRoD3KVfE6xt8KR5tsxwFGA1iKGqTWpIU2PIlA4
 tdRQO4q84kQUtfSJs4HhZz7yv8anyxHEZoNT
X-Google-Smtp-Source: ABdhPJxLQ341K5whiV2LoAR6T9CPdCA8b9BG2jR8oW5APGzNisYVewAsue4ah/TvzD8Gp+L5hnU68w==
X-Received: by 2002:a65:67d4:: with SMTP id b20mr1847617pgs.245.1603456938213; 
 Fri, 23 Oct 2020 05:42:18 -0700 (PDT)
Received: from pulp100.localdomain ([103.199.158.131])
 by smtp.gmail.com with ESMTPSA id n139sm2024825pfd.167.2020.10.23.05.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:42:17 -0700 (PDT)
From: Chetan Pant <chetan4windows@gmail.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, dmitry.fleytman@gmail.com,
 Chetan Pant <chetan4windows@gmail.com>
Subject: [PATCH 28/30] e1000e: Fix Lesser GPL version number
Date: Fri, 23 Oct 2020 12:41:34 +0000
Message-Id: <20201023124134.20083-1-chetan4windows@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014134248.14146-1-chetan4windows@gmail.com>
References: <20201014134248.14146-1-chetan4windows@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=chetan4windows@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Oct 2020 12:42:25 -0000

There is no "version 2" of the "Lesser" General Public License.
It is either "GPL version 2.0" or "Lesser GPL version 2.1".
This patch replaces all occurrences of "Lesser GPL version 2" with
"Lesser GPL version 2.1" in comment section.

Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
---
 hw/net/e1000e.c        | 2 +-
 hw/net/e1000e_core.c   | 2 +-
 hw/net/e1000e_core.h   | 2 +-
 hw/net/e1000x_common.c | 2 +-
 hw/net/e1000x_common.h | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index b6f1ae3..a8a77ec 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -22,7 +22,7 @@
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
-* version 2 of the License, or (at your option) any later version.
+* version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index bcfd466..d8b9e4b 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -22,7 +22,7 @@
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
-* version 2 of the License, or (at your option) any later version.
+* version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index aee32f7..4ddb4d2 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -22,7 +22,7 @@
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
-* version 2 of the License, or (at your option) any later version.
+* version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index 717f9df..a8d9387 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -11,7 +11,7 @@
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
-* version 2 of the License, or (at your option) any later version.
+* version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index 19c56f4..b774277 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -11,7 +11,7 @@
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
-* version 2 of the License, or (at your option) any later version.
+* version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.17.1


