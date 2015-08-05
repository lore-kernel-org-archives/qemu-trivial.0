Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMvKe-0002Za-G0
	for mharc-qemu-trivial@gnu.org; Wed, 05 Aug 2015 05:49:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZMvKb-0002W2-CR
	for qemu-trivial@nongnu.org; Wed, 05 Aug 2015 05:49:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZMvKa-0004ft-CD
	for qemu-trivial@nongnu.org; Wed, 05 Aug 2015 05:49:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZMvKV-0004Xg-05; Wed, 05 Aug 2015 05:49:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id E8B378C1B8;
	Wed,  5 Aug 2015 09:49:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t759ng2v023809
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 5 Aug 2015 05:49:44 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 72F513011FA4; Wed,  5 Aug 2015 11:49:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1435775149-17285-1-git-send-email-jsnow@redhat.com>
	<20150702113102.39ab42a5@redhat.com> <559BFF5B.4050405@redhat.com>
	<87615biaux.fsf@blackfin.pond.sub.org>
	<20150730104824.1e87989d@redhat.com>
Date: Wed, 05 Aug 2015 11:49:41 +0200
In-Reply-To: <20150730104824.1e87989d@redhat.com> (Luiz Capitulino's message
	of "Thu, 30 Jul 2015 10:48:24 -0400")
Message-ID: <87r3niqd3e.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>, mjt@tls.msk.ru,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-shell: add documentation
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
X-List-Received-Date: Wed, 05 Aug 2015 09:49:54 -0000

Luiz Capitulino <lcapitulino@redhat.com> writes:

> On Thu, 23 Jul 2015 09:36:38 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> John Snow <jsnow@redhat.com> writes:
>> 
>> > On 07/02/2015 11:31 AM, Luiz Capitulino wrote:
>> >> On Wed,  1 Jul 2015 14:25:49 -0400
>> >> John Snow <jsnow@redhat.com> wrote:
>> >> 
>> >>> I should probably document the changes that were made.
>> 
>> John, what do you mean here?
>> 
>> >>> Signed-off-by: John Snow <jsnow@redhat.com>
>> >> 
>> >> Looks good to me, CC'ing maintainer.
>> 
>> Luiz, is this a R-by?
>
> Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
>
> This one is :)

Applied to my qapi-next branch, with "Cc: qemu-trivial@nongnu.org" added
to commit message, thanks!

