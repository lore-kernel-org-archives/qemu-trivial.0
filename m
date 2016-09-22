Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bmvSj-0005mk-IV
	for mharc-qemu-trivial@gnu.org; Thu, 22 Sep 2016 00:18:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1bmvCk-0007WP-Ko
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 00:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1bmvCh-0005jQ-Hc
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 00:01:46 -0400
Received: from mail-pf0-f172.google.com ([209.85.192.172]:33354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dave@natulte.net>) id 1bmvCh-0005jF-Ay
	for qemu-trivial@nongnu.org; Thu, 22 Sep 2016 00:01:43 -0400
Received: by mail-pf0-f172.google.com with SMTP id 21so25990279pfy.0
	for <qemu-trivial@nongnu.org>; Wed, 21 Sep 2016 21:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=natulte-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ffEPBFnMfBE0/ak6eVwAReWqTHCFMnjatIdDjGbZisA=;
	b=LcVlB574STGaC/unlA3g2OcVySKumxBjzwEKrBYSMBKpW1MTN5odqaJZ9bxkwMOV1N
	3M96GuLH9Lcyka2Z4UYZRjhvy9dnQZC1Rg0HFQ2eg5bzdnze+LnmKbD9f2oUug75OHRC
	v/FPy39okPW8WcA39FJXD6rKwMOjr9mmfXPGDPTd7zz7CLespMk42LhoEsIFwNjR6bKi
	Z3mQ4rZxPq36nyRRZ1OdWRhDRZWem6DS5XVsAVzcow4fkVkbjGvRrQjT7zvD/9OMh6jm
	/Nqz3dkyA7lFNvpBwHIqsuFcfckjxBUd2ro/wSkClXPctqlKJ9x7ZDtfOuig4cFKHZ74
	COMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ffEPBFnMfBE0/ak6eVwAReWqTHCFMnjatIdDjGbZisA=;
	b=caEx6lBqWG2J827v1QfUvcqTFFJzArK7J16vlBAtC76x3gqa/v1Cu/3sVX8lOeqGh7
	EIK8Nmvdzyudy68twz7ow8HxRf8vJD2utacjgJPHLhLKpCjL4e7hSIspGSwCAMGEbjCY
	m/n7/NA5xQ/PboqZrZfqc18+ba/k33CWywVWcx3UNGki6OqQQBTLm0Z+yIhlmFks2ghO
	am3wgG73bWSh8yvK+JUUfbowp+jEZY8B/2ot0cNqhCMvMpdM79ryyU1E1m+KSh7OCe+7
	4SC1iwPOjHyOscq2+SUcxNgRdsOthPLoDcYHfpAsP67+G8QHpYMPOAzJBzAOXc+4VbVf
	PRkQ==
X-Gm-Message-State: AE9vXwNG11Rni1KkOdvyXVNe4Hbg/dKgQ/2LtDNn4eUDlYpgnNdpEymUBwJDax89sSCp9A==
X-Received: by 10.98.91.197 with SMTP id p188mr72197597pfb.101.1474516842259; 
	Wed, 21 Sep 2016 21:00:42 -0700 (PDT)
Received: from vega.home.universe.tf ([2001:470:49c4::95e6])
	by smtp.gmail.com with ESMTPSA id 3sm49700790pai.48.2016.09.21.21.00.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 21:00:40 -0700 (PDT)
From: David Anderson <dave@natulte.net>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	David Anderson <dave@natulte.net>
Date: Wed, 21 Sep 2016 21:00:19 -0700
Message-Id: <20160922040019.19165-1-dave@natulte.net>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.172
X-Mailman-Approved-At: Thu, 22 Sep 2016 00:18:15 -0400
Subject: [Qemu-trivial] [PATCH] qapi: make the json schema files more
 regular.
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
X-List-Received-Date: Thu, 22 Sep 2016 04:01:47 -0000

This makes it easier to parse the schema file for tool generation:
each paragraph is either a non-docstring comment, or a docstring
immediately followed by a Python dict describing an API item.

Signed-off-by: David Anderson <dave@natulte.net>
---
 qapi-schema.json     | 3 +--
 qapi/block-core.json | 5 -----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index e507061..edd803f 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -752,6 +752,7 @@
             'cpu-throttle-increment': 'int',
             'tls-creds': 'str',
             'tls-hostname': 'str'} }
+
 ##
 # @query-migrate-parameters
 #
@@ -4115,7 +4116,6 @@
 #
 # Since 1.6
 ##
-
 { 'struct': 'RxFilterInfo',
   'data': {
     'name':               'str',
@@ -4335,7 +4335,6 @@
 #
 # Since: 2.1
 ##
-
 { 'struct': 'Memdev',
   'data': {
     'size':       'size',
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 24223fd..e12fbd3 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -25,7 +25,6 @@
 # Since: 1.3
 #
 ##
-
 { 'struct': 'SnapshotInfo',
   'data': { 'id': 'str', 'name': 'str', 'vm-state-size': 'int',
             'date-sec': 'int', 'date-nsec': 'int',
@@ -81,7 +80,6 @@
 #
 # Since: 1.7
 ##
-
 { 'union': 'ImageInfoSpecific',
   'data': {
       'qcow2': 'ImageInfoSpecificQCow2',
@@ -129,7 +127,6 @@
 # Since: 1.3
 #
 ##
-
 { 'struct': 'ImageInfo',
   'data': {'filename': 'str', 'format': 'str', '*dirty-flag': 'bool',
            '*actual-size': 'int', 'virtual-size': 'int',
@@ -181,7 +178,6 @@
 # Since: 1.4
 #
 ##
-
 { 'struct': 'ImageCheck',
   'data': {'filename': 'str', 'format': 'str', 'check-errors': 'int',
            '*image-end-offset': 'int', '*corruptions': 'int', '*leaks': 'int',
@@ -518,7 +514,6 @@
 #
 # Since: 2.5
 ##
-
 { 'struct': 'BlockDeviceTimedStats',
   'data': { 'interval_length': 'int', 'min_rd_latency_ns': 'int',
             'max_rd_latency_ns': 'int', 'avg_rd_latency_ns': 'int',
-- 
2.9.3


