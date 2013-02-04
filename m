Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2MPX-0007VR-20
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 08:48:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U2MPV-0007Ps-5A
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 08:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U2MPU-00039R-0Z
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 08:48:37 -0500
Received: from cantor2.suse.de ([195.135.220.15]:53791 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1U2MPQ-00037W-IC; Mon, 04 Feb 2013 08:48:32 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id B4F11A50DE;
	Mon,  4 Feb 2013 14:48:31 +0100 (CET)
Message-ID: <510FBC2C.1000500@suse.de>
Date: Mon, 04 Feb 2013 14:48:28 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Fabien Chouteau <chouteau@adacore.com>
References: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
	<20130204083900.GB5216@stefanha-thinkpad.redhat.com>
	<87k3qov047.fsf@blackfin.pond.sub.org>
	<510F9B09.7030804@adacore.com>
	<87obg0s1wf.fsf@blackfin.pond.sub.org>
	<510FB89E.1080504@adacore.com>
In-Reply-To: <510FB89E.1080504@adacore.com>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com,
	Markus Armbruster <armbru@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] get_tmp_filename: add
	explicit error message
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
X-List-Received-Date: Mon, 04 Feb 2013 13:48:38 -0000

Am 04.02.2013 14:33, schrieb Fabien Chouteau:
> On 02/04/2013 01:24 PM, Markus Armbruster wrote:
>>
>> Good error reporting is hard.  Knowledge about the error and its conte=
xt
>> gets lost as you move up the call chain.  Knowledge about how to repor=
t
>> errors gets lost as you move down.
>>
>=20
> You're right, and in my opinion, no error reporting is the worst case.

The best solution would be to pass an Error **errp argument and use
error_setg() on it, as done for visitors and QOM. Then the caller can
decide whether to pass NULL and the callee can report detailed errors.
Invasive change obviously and thus not suitable for 1.4.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

