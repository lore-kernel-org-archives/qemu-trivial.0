Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ft5cC-00045U-Nj
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2018 02:30:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ft5cA-00043y-Eh
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2018 02:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ft5c8-0003fv-6o
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2018 02:30:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47628 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ft5c3-0003a3-Lq; Fri, 24 Aug 2018 02:30:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6A56402315B;
	Fri, 24 Aug 2018 06:30:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-97.ams2.redhat.com
	[10.36.116.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E4B63F34;
	Fri, 24 Aug 2018 06:30:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C6FC6113854A; Fri, 24 Aug 2018 08:30:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20180419132026.5494-1-kraxel@redhat.com>
	<20180419132026.5494-2-kraxel@redhat.com>
	<87va92dv39.fsf@dusky.pond.sub.org>
Date: Fri, 24 Aug 2018 08:30:23 +0200
In-Reply-To: <87va92dv39.fsf@dusky.pond.sub.org> (Markus Armbruster's message
	of "Thu, 26 Jul 2018 14:45:14 +0200")
Message-ID: <87tvnk6zuo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 24 Aug 2018 06:30:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 24 Aug 2018 06:30:26 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] ui: add qapi parser for
 -display
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
X-List-Received-Date: Fri, 24 Aug 2018 06:30:35 -0000

Markus Armbruster <armbru@redhat.com> writes:

> Gerd Hoffmann <kraxel@redhat.com> writes:
>
>> Add parse_display_qapi() function which parses the -display command line
>> using a qapi visitor for DisplayOptions.  Wire up as default catch in
>> parse_display().
>>
>> Improves the error message for unknown display types.
>>
>> Also enables json as -display argument, i.e. -display "{ 'type': 'gtk' }"
>
> This new option argument syntax is undocumented.  Intentional?

Please advise.

