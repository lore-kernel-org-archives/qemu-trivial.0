Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNkko-0000yX-S9
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 07:26:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNkki-0000av-Nm
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 07:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNkkh-0004PA-I0
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 07:26:08 -0500
Received: from mail-wy0-f173.google.com ([74.125.82.173]:37668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNkkf-0004Oi-K8; Tue, 08 Nov 2011 07:26:05 -0500
Received: by wyh22 with SMTP id 22so430191wyh.4
	for <multiple recipients>; Tue, 08 Nov 2011 04:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=c0zB99HTaR0JyO3TQ/rJLorbkHIy6cnjN/5EQZLlsco=;
	b=g0OMIVE39RD9IFV6FQVLDTG9C5bqPgLT8xLXTH8vAnkERS9oqgA6kU1Fv1FL4nfG4M
	/2UGyXwXHotrziBZlgLs9S3SRt+TH8LgDJJglEVZcr2aMCA8MCtTMbaRWAE3c2MZHgJu
	ANcKK6ZgMprLICI96bqUQXj+jftoN5u/dtdEc=
MIME-Version: 1.0
Received: by 10.180.90.6 with SMTP id bs6mr12729300wib.63.1320755164446; Tue,
	08 Nov 2011 04:26:04 -0800 (PST)
Received: by 10.180.85.165 with HTTP; Tue, 8 Nov 2011 04:26:04 -0800 (PST)
In-Reply-To: <20111108104950.GB18592@stefanha-thinkpad.localdomain>
References: <1320746152-31620-1-git-send-email-armbru@redhat.com>
	<20111108104950.GB18592@stefanha-thinkpad.localdomain>
Date: Tue, 8 Nov 2011 12:26:04 +0000
Message-ID: <CAJSP0QXkAGCgh8kKaTfx2pZQZVUAdq=tAkyrFyOK5+2CK+aQPw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ui/vnc: Convert
 sasl.mechlist to g_malloc() & friends
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
X-List-Received-Date: Tue, 08 Nov 2011 12:26:12 -0000

On Tue, Nov 8, 2011 at 10:49 AM, Stefan Hajnoczi <stefanha@gmail.com> wrote=
:
> On Tue, Nov 08, 2011 at 10:55:52AM +0100, Markus Armbruster wrote:
>> Fixes protocol_client_auth_sasl_mechname() not to crash when malloc()
>> fails. =A0Spotted by Coverity.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>> =A0ui/vnc-auth-sasl.c | =A0 10 +++++-----
>> =A01 files changed, 5 insertions(+), 5 deletions(-)
> Thanks, merged into the trivial-patches tree:

I'll grab the new version when it comes out.

Stefan

