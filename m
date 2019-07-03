Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hijsq-0001MD-S6
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jul 2019 14:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59151)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hijso-0001G7-62
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 14:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hijsn-0008Hz-07
 for qemu-trivial@nongnu.org; Wed, 03 Jul 2019 14:21:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hijsU-0007yb-GR; Wed, 03 Jul 2019 14:21:12 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C72472F8BEB;
 Wed,  3 Jul 2019 18:21:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94D831001B3E;
 Wed,  3 Jul 2019 18:21:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0687A1132ABF; Wed,  3 Jul 2019 20:21:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <tony.nguyen@bt.com>
Cc: <qemu-devel@nongnu.org>,  qemu-trivial@nongnu.org
References: <dce313b46d294ada8826d34609a3447e@tpw09926dag18e.domain1.systemhost.net>
Date: Wed, 03 Jul 2019 20:21:02 +0200
In-Reply-To: <dce313b46d294ada8826d34609a3447e@tpw09926dag18e.domain1.systemhost.net>
 (tony nguyen's message of "Sat, 8 Jun 2019 05:25:52 +0000")
Message-ID: <875zojvv1t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 03 Jul 2019 18:21:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] test: Use g_strndup
 instead of plain strndup
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
X-List-Received-Date: Wed, 03 Jul 2019 18:21:31 -0000

<tony.nguyen@bt.com> writes:

> Due to memory management rules. See HACKING.
>     
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

I apologize for the delay.

