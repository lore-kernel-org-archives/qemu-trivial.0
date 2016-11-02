Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1pp3-00009c-1a
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 03:18:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c1pp0-000091-5H
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1c1pov-0005cN-82
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:18:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40528)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1c1pov-0005cB-2j
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 03:18:49 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1748485;
	Wed,  2 Nov 2016 07:18:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-24.ams2.redhat.com
	[10.36.116.24])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA27IiIV016169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 2 Nov 2016 03:18:46 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5E5EA11386CE; Wed,  2 Nov 2016 08:18:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Cc: <eblake@redhat.com>, <qemu-trivial@nongnu.org>
References: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
Date: Wed, 02 Nov 2016 08:18:44 +0100
In-Reply-To: <1477979511-15460-1-git-send-email-zhang.zhanghailiang@huawei.com>
	(zhanghailiang's message of "Tue, 1 Nov 2016 13:51:51 +0800")
Message-ID: <87oa1ytkmj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 02 Nov 2016 07:18:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qapi-schema: clarify 'colo' state for
 MigrationStatus
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
X-List-Received-Date: Wed, 02 Nov 2016 07:18:55 -0000

You forgot to copy qemu@nongnu.org.  Please resend.

