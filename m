Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJLvJ-0006KQ-7w
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 04:34:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJLvF-0006Cb-OI
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 04:34:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJLvE-0002HF-LM
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 04:34:33 -0400
Received: from mail-gw0-f45.google.com ([74.125.83.45]:65435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJLvC-0002Gn-GP; Mon, 09 May 2011 04:34:30 -0400
Received: by gwb19 with SMTP id 19so2052507gwb.4
	for <multiple recipients>; Mon, 09 May 2011 01:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=sEkwC8E3CAkYcS0V1/rBTpZchZ7R3BAqjYbCPVVcNhY=;
	b=a85MbAzolaaYH3nkJ4TcknDozB+7ga6572nzJoP85H8G+VydYgcHHfn/4XXcTeaPBz
	dUqXuxkCE0QHytxmHfa8+Krs3z87rVns37LLsUYB5wJQ2z6Epozt2DpsU7N5I6A8+uiC
	YJVr4PBtc7Ul85X3mvReAx+S5oU23Z5/szVwk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Lk+DMd649zSzY+ingJppF//6I1CRt0kbHdMt5QblTOTZXBRfK2b3Skq/sq3++CUTzI
	34Tvs/TM7JNkOzOL4ddwp5NJiSFSaXQU/Sq0kj/JZm5UGQa++1dXDmPAlkqHGbXQpO2D
	yaC3bOvK/R2kStd0Q22YlID5SRogmYl7Hjtvk=
MIME-Version: 1.0
Received: by 10.146.73.11 with SMTP id v11mr5214966yaa.15.1304930069710; Mon,
	09 May 2011 01:34:29 -0700 (PDT)
Received: by 10.147.172.9 with HTTP; Mon, 9 May 2011 01:34:29 -0700 (PDT)
In-Reply-To: <4DC78F5D.7080505@redhat.com>
References: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>
	<BANLkTikq7uuwZOhdFdJD4a1PkHneD6a=Fg@mail.gmail.com>
	<4DC78F5D.7080505@redhat.com>
Date: Mon, 9 May 2011 09:34:29 +0100
Message-ID: <BANLkTinvh3YJMqJJG9mm27MSYShyBDeZtg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] fix compilation when reconfiguring
 without dtrace backend
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
X-List-Received-Date: Mon, 09 May 2011 08:34:34 -0000

On Mon, May 9, 2011 at 7:53 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 05/08/2011 01:15 PM, Stefan Hajnoczi wrote:
>>
>> I think the real problem is that dependencies need to be regenerated
>> after ./configure?
>
> There are three ways to do that, the trivial but wrong one, and the corre=
ct
> but overzealous one:
>
> - delete .d files. =A0This forces regeneration of dependencies, but if yo=
u do
> not correspondingly delete .o files, you will likely have an incomplete
> build (possibly _nothing_ will be built).
>
> - delete .d and .o files. =A0This forces regeneration of dependencies and
> recompilation. =A0True, a lot of distros are using ccache nowadays, but s=
till
> this will cause a complete walk of all directories to pass those files to
> ccache and relink the executables. =A0It will likely take a minute or thr=
ee.

The .o files should depend on GENERATED_HEADERS (especially
config-host.h) and therefore be rebuilt by make when ./configure
outputs a new configuration.  If the configuration is identical an
unnecessary rebuild is triggered but this can be mitigated using
ccache like you say.

So I think just deleting .d files is enough.  BTW the Makefiles don't
seem to have a step before compilation to generate all the
dependencies, instead dependencies only kick in after the first build
has completed?

> - detect changes in the configuration and, if those happen, delete .d and=
 .o
> files. =A0This is the correct one, and for one what the Linux kernel make=
files
> do, but also the biggest effort to implement.

Is there some smart change detection you are thinking about or just
something like keeping the old copy of config-host.h and friends to
see if they have changed?

Stefan

