Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B924EC4452B
	for <qemu-trivial@archiver.kernel.org>; Thu, 23 Jul 2026 04:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wmlQ9-0001uP-N1; Thu, 23 Jul 2026 00:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1wmlQ7-0001mk-Vb
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 00:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1wmlQ6-0004hP-BM
 for qemu-trivial@nongnu.org; Thu, 23 Jul 2026 00:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784782349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qna4Kk34qAEZX+aFniaTwQbeBYZCyqG8FCN8r26Wd5s=;
 b=Xaw4NX7+M6YHo5Xfi5K2lM4MaBokH+BxZ8r2juQ0rt/fSvFNf8+BJ8+2tXplKa9Ze0iYwD
 olCcO1HsIkrAMRe3JtPog4dG5z9zjmdKr3qOPi7m894P9Tr50uvL4dUC3XZX4nZ3Wf8sg5
 A1/QhSTbY8yuiGJrXeTrVXsXOZDRcG0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-SIM3_0RqMgO2nvYLk4Ic4Q-1; Thu,
 23 Jul 2026 00:52:24 -0400
X-MC-Unique: SIM3_0RqMgO2nvYLk4Ic4Q-1
X-Mimecast-MFC-AGG-ID: SIM3_0RqMgO2nvYLk4Ic4Q_1784782341
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 12CB8180A8E0; Thu, 23 Jul 2026 04:52:21 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.44])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 63B04180029D; Thu, 23 Jul 2026 04:52:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Zhao Liu <zhao1.liu@intel.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Alex Williamson <alex@shazbot.org>, zhenwei pi <zhenwei.pi@linux.dev>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 linux-cxl@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-edac@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org,
 Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 24/44] qapi: convert trivial intro sections for stats.json
Date: Thu, 23 Jul 2026 00:47:45 -0400
Message-ID: <20260723044805.527643-25-jsnow@redhat.com>
In-Reply-To: <20260723044805.527643-1-jsnow@redhat.com>
References: <20260723044805.527643-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: ubaO4Go911GfJ4LmGxxgt8y9gSIVVVtK10bLkemCBb4_1784782341
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=jsnow@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

(Trivial)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/stats.json | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/qapi/stats.json b/qapi/stats.json
index a98624531c3..af57ec08546 100644
--- a/qapi/stats.json
+++ b/qapi/stats.json
@@ -16,8 +16,7 @@
 
 ##
 # @StatsType:
-#
-# Enumeration of statistics types
+#     Enumeration of statistics types
 #
 # @cumulative: stat is cumulative; value can only increase.
 #
@@ -38,8 +37,7 @@
 
 ##
 # @StatsUnit:
-#
-# Enumeration of unit of measurement for statistics
+#     Enumeration of unit of measurement for statistics
 #
 # @bytes: stat reported in bytes.
 #
@@ -56,8 +54,7 @@
 
 ##
 # @StatsProvider:
-#
-# Enumeration of statistics providers.
+#     Enumeration of statistics providers.
 #
 # @kvm: since 7.1
 #
@@ -70,8 +67,7 @@
 
 ##
 # @StatsTarget:
-#
-# The kinds of objects on which one can request statistics.
+#     The kinds of objects on which one can request statistics.
 #
 # @vm: statistics that apply to the entire virtual machine or the
 #     entire QEMU process.
@@ -87,9 +83,8 @@
 
 ##
 # @StatsRequest:
-#
-# Indicates a set of statistics that should be returned by
-# `query-stats`.
+#     Indicates a set of statistics that should be returned by
+#     `query-stats`.
 #
 # @provider: provider for which to return statistics.
 #
@@ -113,10 +108,9 @@
 
 ##
 # @StatsFilter:
-#
-# The arguments to the `query-stats` command; specifies a target for
-# which to request statistics and optionally the required subset of
-# information for that target.
+#     The arguments to the `query-stats` command; specifies a target
+#     for which to request statistics and optionally the required
+#     subset of information for that target.
 #
 # @target: the kind of objects to query.  Note that each possible
 #     target may enable additional filtering options
@@ -200,8 +194,7 @@
 
 ##
 # @StatsSchemaValue:
-#
-# Schema for a single statistic.
+#     Schema for a single statistic.
 #
 # @name: name of the statistic; each element of the schema is uniquely
 #     identified by a target, a provider (both available in
@@ -236,8 +229,7 @@
 
 ##
 # @StatsSchema:
-#
-# Schema for all available statistics for a provider and target.
+#     Schema for all available statistics for a provider and target.
 #
 # @provider: provider for this set of statistics.
 #
@@ -255,8 +247,8 @@
 
 ##
 # @query-stats-schemas:
-#
-# Return the schema for all available runtime-collected statistics.
+#     Return the schema for all available runtime-collected
+#     statistics.
 #
 # @provider: a provider to restrict the query to.
 #
-- 
2.55.0


