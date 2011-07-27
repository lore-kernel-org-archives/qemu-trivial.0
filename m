Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm2dP-0006tw-Fe
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 07:50:43 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qm2dN-0006on-3N
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 07:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qm2dM-0000Mf-58
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 07:50:40 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:64882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qm2dK-0000ME-1g; Wed, 27 Jul 2011 07:50:38 -0400
Received: by vxi29 with SMTP id 29so1196381vxi.4
	for <multiple recipients>; Wed, 27 Jul 2011 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=xxLtLygGgXBMLleTFGUCDV/vp/PkCM5JmwrGmH2RCcA=;
	b=CbUDPj947mndu7gbwvEfcWUhcTPA3G9I3HFxGNWQ71Q9c+E36jX1ijsfXz2MBg+PPJ
	MiFqXouab+fbE2AUud9jHaBdepg/yg5x3KCM+cikzHN9llBamY39uQARngBuYQGfSNZS
	g7h9Q3t4d2T3SkUmga7+kWpRITP4mkXcfN14U=
MIME-Version: 1.0
Received: by 10.220.96.81 with SMTP id g17mr1757141vcn.160.1311767437095; Wed,
	27 Jul 2011 04:50:37 -0700 (PDT)
Received: by 10.220.22.79 with HTTP; Wed, 27 Jul 2011 04:50:37 -0700 (PDT)
In-Reply-To: <4E2FF582.20602@siemens.com>
References: <20110727031126.GA22433@rox.home.comstyle.com>
	<4E2FF582.20602@siemens.com>
Date: Wed, 27 Jul 2011 12:50:37 +0100
Message-ID: <CAJSP0QWt7n6N-fF=Gxn9t2d-tfKTo2VswcpBvDpEmeoh=D4u=g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Brad <brad@comstyle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix configure display for non-Linux OS's
 and the KVM / vhost-net features to show "no"
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
X-List-Received-Date: Wed, 27 Jul 2011 11:50:42 -0000

On Wed, Jul 27, 2011 at 12:24 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote=
:
> On 2011-07-27 05:11, Brad wrote:
>> diff --git a/configure b/configure
>> index dc9a1fe..ef8a4c8 100755
>> --- a/configure
>> +++ b/configure
>> @@ -113,7 +113,6 @@ curl=3D""
>> =A0curses=3D""
>> =A0docs=3D""
>> =A0fdt=3D""
>> -kvm=3D""
>> =A0nptl=3D""
>> =A0sdl=3D""
>> =A0vnc=3D"yes"
>> @@ -129,9 +128,10 @@ xen=3D""
>> =A0xen_ctrl_version=3D""
>> =A0linux_aio=3D""
>> =A0attr=3D""
>> -vhost_net=3D""
>> =A0xfs=3D""
>>
>> +vhost_net=3D"no"
>> +kvm=3D"no"
>> =A0gprof=3D"no"
>> =A0debug_tcg=3D"no"
>> =A0debug_mon=3D"no"
>> -- 1.7.6
>
> Acked-by: Jan Kiszka <jan.kiszka@siemens.com>
>
> Should probably be fine for the trivial tree.

I sent out a pull request for trivial-patches.  This patch will be
added for the next pull request.

Stefan

