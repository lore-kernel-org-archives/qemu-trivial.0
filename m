Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3tAF-0007s9-SG
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 13:59:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3t9u-0007aM-Ms
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:58:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3t9t-0007TC-Cd
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:58:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:61514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U3t9p-0007Rp-Uz; Fri, 08 Feb 2013 13:58:46 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18IwiTK026247
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 13:58:44 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r18Iwh4w026700; Fri, 8 Feb 2013 13:58:43 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C126C200AA; Fri,  8 Feb 2013 19:58:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-5-git-send-email-armbru@redhat.com>
	<20130208155324.0c456dcc@redhat.com>
Date: Fri, 08 Feb 2013 19:58:42 +0100
In-Reply-To: <20130208155324.0c456dcc@redhat.com> (Luiz Capitulino's message
	of "Fri, 8 Feb 2013 15:53:24 -0200")
Message-ID: <87sj56d44d.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 4/6] qemu-option: Disable two
	helpful messages that got broken recently
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
X-List-Received-Date: Fri, 08 Feb 2013 18:59:10 -0000

Luiz Capitulino <lcapitulino@redhat.com> writes:

> On Fri,  8 Feb 2013 17:17:10 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> commit 8be7e7e4 and commit ec7b2ccb messed up the ordering of error
>> message and the helpful explanation that should follow it, like this:
>> 
>>     $ qemu-system-x86_64 --nodefaults -S --vnc :0 --chardev null,id=,
>>     Identifiers consist of letters, digits, '-', '.', '_', starting
>> with a letter.
>>     qemu-system-x86_64: -chardev null,id=,: Parameter 'id' expects
>> an identifier
>> 
>>     $ qemu-system-x86_64 --nodefaults -S --vnc :0 --machine
>> kvm_shadow_mem=dunno
>>     You may use k, M, G or T suffixes for kilobytes, megabytes,
>> gigabytes and terabytes.
>>     qemu-system-x86_64: -machine kvm_shadow_mem=dunno: Parameter
>> kvm_shadow_mem' expects a size
>> 
>> Pity.  Disable them for now.
>
> Oops, sorry. I think I'd prefer to drop them, but as this fixes the problem:
>
> Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
>
> Also, the real problem here is that general functions like parse_option_size()
> should never assume/try to guess in which context they're running. So, the
> best solution here is either to have a general enough error message that's
> not tied to any context, or let up layers (say vl.c) concatenate the
> context-dependent part of the error message.

I'm open to suggestions on how to better code the pattern "report an
error (a short string without newlines) together with some explanation
or hint (possibly longer string, newlines okay).

