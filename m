Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxR-0004P0-RY
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxP-0004Nk-2E
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxO-0003YP-E7
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:03 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxJ-0003Rw-Vf; Fri, 28 Jul 2017 01:36:58 -0400
Received: by mail-qt0-x244.google.com with SMTP id i19so11807718qte.1;
	Thu, 27 Jul 2017 22:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vzPQrtC6pHVRf8KGDhTYnPOxHogusbMHMwsgxTZOQPc=;
	b=gxaxXYMnJ/MDdImsWGsriT05iqAXshXXglvpG9xqKz8MVrru40D3bN2BKnnCfTSRf1
	BRfVGY4vUpZmdMmOCPwlG56jyv28WYWsAF7euyqh/iNKO45Xxg+WyxPehSIydjOnkAn1
	qhfmJ0Di2XoJf575zSYx6KTugn+aDBIB93sE1P2xhbBw1szBdKuoJsea48mPXSEfugJ3
	9s2us/L5YfruLNOb4gycGLtnA8N7qqvlDSk2T9jUJBxU4q1cNouqbli6P//65xXzr8ky
	tcDw2TQ6mkgpOfR9z8zDJAdvqGaa5daQz5hHfXVqKVWZ5t7qxB+sBX4e40B7rPopEl3w
	vBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=vzPQrtC6pHVRf8KGDhTYnPOxHogusbMHMwsgxTZOQPc=;
	b=MqtbgIBzwjw/scC8ZrGcD6FafahRhb1I3UGcoPKC9epqux/3Tm7VkDK0a4rGTSaK2V
	tUF+RziN07QrIA4OZwCqZ+uVPBQoRyG7/gTW+QxPAsakpCVlaFRUnRYGj6mH299vD0CV
	aIixTe7sycb1QHXefqQNMYAlLs7R/hKZyjJ9cKa72NQjuaRssGjy2J9mCWwHdibV0MeM
	80YSOsb/1R3ihrxod1GZMyPT+NJN+X7yMw7AXrUI2tRZSCQ163NIZrpKq18G/chUjauf
	dfh0RaiYKOxZxT4M/VWWPTwt6+eG7/LO59/NU7Eujl6xj4OkZYQ391ng00vwI807hHEI
	Nutg==
X-Gm-Message-State: AIVw111Vm1h3pw7QjIuAu1U83kc9iX8pKhZKuMaOut6yATqNsJfxomOY
	lsqHG0Z9uWP/QA==
X-Received: by 10.237.56.232 with SMTP id k95mr8999742qte.241.1501220217584;
	Thu, 27 Jul 2017 22:36:57 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Dmitry Fleytman <dmitry@daynix.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:38 -0300
Message-Id: <20170728053610.15770-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [RFC PATCH 15/47] MAINTAINERS: add missing VMWare
 entry
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:05 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

RFC because I'm not sure about tests/

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8aef164ca..9670a3901a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1140,6 +1140,7 @@ M: Dmitry Fleytman <dmitry@daynix.com>
 S: Maintained
 F: hw/net/vmxnet*
 F: hw/scsi/vmw_pvscsi*
+F: tests/vmxnet3-test.c
 
 Rocker
 M: Jiri Pirko <jiri@resnulli.us>
-- 
2.13.3


