Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAKZV-0003Eh-EE
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jul 2015 12:09:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZAKZS-0003Aq-EC
	for qemu-trivial@nongnu.org; Wed, 01 Jul 2015 12:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZAKZR-00033v-KB
	for qemu-trivial@nongnu.org; Wed, 01 Jul 2015 12:09:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZAKZM-00031e-Bc; Wed, 01 Jul 2015 12:09:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id EB8882CD854;
	Wed,  1 Jul 2015 16:09:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-37.ams2.redhat.com
	[10.36.116.37])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t61G92DW009871
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 1 Jul 2015 12:09:03 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D1C24303FEAE; Wed,  1 Jul 2015 18:09:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1435655374-20741-1-git-send-email-kraxel@redhat.com>
	<CAFEAcA8iq5Q84NH59zjS67O93Vq7a1u=9iyoVXB-GeuxA4BVag@mail.gmail.com>
	<1435663095.30958.54.camel@redhat.com>
Date: Wed, 01 Jul 2015 18:09:00 +0200
In-Reply-To: <1435663095.30958.54.camel@redhat.com> (Gerd Hoffmann's message
	of "Tue, 30 Jun 2015 13:18:15 +0200")
Message-ID: <87fv57hnc3.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move QemuOpts from
	qemu/option.h to qemu/typedefs.h
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
X-List-Received-Date: Wed, 01 Jul 2015 16:09:11 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Di, 2015-06-30 at 10:15 +0100, Peter Maydell wrote:
>> On 30 June 2015 at 10:09, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> > ---
>> >  include/qemu/option.h   | 2 +-
>> >  include/qemu/typedefs.h | 1 +
>> >  2 files changed, 2 insertions(+), 1 deletion(-)
>> 
>> I don't object necessarily, but it would be nice if the
>> commit message said what the rationale for the change was...
>
> Build failure, with not-yet submitted patches,
> due to QemuOpts being undeclared.

Recommend to post it right before a patch that breaks without it,
because that makes explaining why easier.

