Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNRYF-0006oS-T7
	for mharc-qemu-trivial@gnu.org; Mon, 28 May 2018 19:27:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRYA-0006j8-Fi
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY9-0000X9-LU
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 19:27:38 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNRY7-0000U8-PI; Mon, 28 May 2018 19:27:35 -0400
Received: by mail-qt0-x244.google.com with SMTP id i18-v6so5884391qtp.12;
	Mon, 28 May 2018 16:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TwZrLuXgZZC+h0a9oXGMPv/Sbhvuax+sVNytTwwQUFA=;
	b=gyvif6QhVCg22PifaqQHGOcrSZyLm95lJHezTsex9yTQ0M9jiSwqti8CToPcsgnLaS
	6gMy+j9W/l4wmGD/E+7KDx0noiwo7wtxoPyfIH8UGO2tE3I+7QEUbl68Lvxi2QBInIZ/
	DQMC5Jvp3el3QzJqTvBVB7T7ampuOKp7JCgrtNE5U358R6ByqStJQAn6It+nB+mDhVPN
	T6DpgVn4vadjmFKlAz5P44dLbe63wV/5Wt5jSzwllgpe9Ekligw2AKSlzJm0FVXzu/Ie
	Vz1wJ9vO5amp38t8sPG1wrtGuFlSl+JUcH7z3UqMYhhj9fWY5XoZ9x3He5tEwDPNZ3FX
	TmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TwZrLuXgZZC+h0a9oXGMPv/Sbhvuax+sVNytTwwQUFA=;
	b=mWGVMePUEfXpoXYXUhJHmpjXulPPPi5fW20rFIN3vdM+DNGHvCR7j22VEW6LK82BOx
	bS1fxMN2PIxHA1442jaksmYbyJ5UD2yxb6mJW3qWsGeQKojxDJ5PIVomgheoZ5yh5Rdk
	+L8HgGroN2nd+ICnGrgFX2eDeKr0RFZtS40z9VtV0NzsPzjv2MFwYbBQXbonv0BFznFM
	DOlhQ8G1q6GpeOyuLMZoJRc5q+RkJ15HQqieq+k+EceDq73Atx2Kqty+9F9cH3ZIWTNA
	4HceVUFqJuO4UVvpgSneNaLaj/xHSTl3R8i8NARYXhqgcOOEgU9tPa+VJQDsbLBZAvxI
	PquA==
X-Gm-Message-State: ALKqPwcSeP6SquDEZIPOdgFsOsf3rXZPi1srYyQ4fNpigqdtZkXGseSM
	VkD+I/r7KbJG+enjdW0e+/M=
X-Google-Smtp-Source: ADUXVKJ9euEs0tUA8/xyzRK2zuC3TbA0tLes+UKLanyXaFWXiI/5OgfaOAEgwOJrLErrdRGUL8gbRw==
X-Received: by 2002:a0c:81e1:: with SMTP id
	30-v6mr13803798qve.187.1527550055276; 
	Mon, 28 May 2018 16:27:35 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s19-v6sm23756182qki.62.2018.05.28.16.27.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 16:27:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>
Date: Mon, 28 May 2018 20:27:00 -0300
Message-Id: <20180528232719.4721-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180528232719.4721-1-f4bug@amsat.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v4 02/21] accel: Do not include
 "exec/address-spaces.h" if it is not necessary
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
X-List-Received-Date: Mon, 28 May 2018 23:27:41 -0000

Code change produced with:
    $ git grep '#include "exec/address-spaces.h"' accel | \
      cut -d: -f-1 | \
      xargs egrep -L "(get_system_|address_space_)" | \
      xargs sed -i.bak '/#include "exec\/address-spaces.h"/d'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 0b154cc678..4ef95d8dd3 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -25,7 +25,6 @@
 #include "qemu/atomic.h"
 #include "sysemu/qtest.h"
 #include "qemu/timer.h"
-#include "exec/address-spaces.h"
 #include "qemu/rcu.h"
 #include "exec/tb-hash.h"
 #include "exec/tb-lookup.h"
-- 
2.17.0


