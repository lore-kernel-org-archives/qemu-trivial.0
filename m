Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXAZz-0000k2-Bu
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 11:35:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YXAZw-0000jX-Tm
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 11:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YXAZo-0004hJ-W7
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 11:35:48 -0400
Received: from mail-we0-f178.google.com ([74.125.82.178]:33713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YXAZo-0004gi-PJ
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 11:35:40 -0400
Received: by wejb47 with SMTP id b47so22360927wej.0
	for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2015 08:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cEA4bv0UMGQ/43pKoS5ClvamP4VE5yz6jE2+HHe4nK0=;
	b=Ek3kvXUKU3IKdSiVszl6Y04cgUmjMJjbg9T06/wmVKAl++u7x0mp0zok1N4ZDOisUA
	sO7tLyvmQNP76yU7eQGkD0Hz0e7oBaAdD7tP/d3bZsODk+Jn0zzhR7Rd18lIFHz3M+4a
	5FX1rTTYLmhJ8/zqRQ3zXYqjfZ2vtWo9rBmor73u/wAWKjnSJHmSQZcDZvJMHAWPZKdR
	8Xd96EIFS1zICHVaurb/N9Y88UqpZXQdvZFgiqOfrQ1UKEV10HkU94M0iiDWcb64Dtlu
	1uCHPMa6otqnBwJ2VSdvcI0fcuNGbXwYck2M0MVP9rzsNmSy8A185c7xodBzuwz4HeIk
	XFLA==
X-Gm-Message-State: ALoCoQkXwMTeg1TA25mk4+X50HuHwEU3SXmZLS+BiplbTKfDIU2g1xlSmFnOotha5Sdm42O6I/pX
X-Received: by 10.194.80.40 with SMTP id o8mr112117006wjx.34.1426433739256;
	Sun, 15 Mar 2015 08:35:39 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63]) by mx.google.com with ESMTPSA id
	ax10sm11423599wjc.26.2015.03.15.08.35.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 08:35:38 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Mar 2015 17:35:25 +0200
Message-Id: <1426433726-21414-1-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.178
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] Another solution for qga-vss stack protection issue
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
X-List-Received-Date: Sun, 15 Mar 2015 15:35:49 -0000

qga/vss-win32/Makefile.objsi filters  out -fstack-protector-all option from C++ flags,
but with commit 63678e17c configure script may add option -fstack-protector-strong,
depending on availability. The suggested change filters out both option for qga-vss.dll
linking.

     Regards,
          Joseph Hindin



