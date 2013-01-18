Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TwE0E-0007Eg-HV
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jan 2013 10:37:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dragonfax@gmail.com>) id 1TwE0A-000729-22
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:37:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dragonfax@gmail.com>) id 1TwE05-0000Nr-V9
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:37:05 -0500
Received: from mail-vb0-f46.google.com ([209.85.212.46]:34045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dragonfax@gmail.com>) id 1TwE05-0000NM-Cm
	for qemu-trivial@nongnu.org; Fri, 18 Jan 2013 10:37:01 -0500
Received: by mail-vb0-f46.google.com with SMTP id b13so3713752vby.19
	for <qemu-trivial@nongnu.org>; Fri, 18 Jan 2013 07:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=IorJn3Ew2fkBWwE32VrxMT8cpAjZiLHWcaCT25w1LLQ=;
	b=NrbtXKADHnF+Tmeu2FWdq1mW6+lxR7ny7OU9I3wNMbY7wakP8WvYm8Hk97DAkCo9WS
	yfZvegfyucwIa0zVkwkKewFS3dDybFt+YYT+Nyjimrdob9OaapyEsD9ylzS+obvHyhmo
	dK0XoZ81fPi4J48dKZDRxhgPhVBbDD7nz4eoUwthC/Mq42WrpZx4UFy+PJ4V2S4YBXg5
	2t93HZ2bdN5tmw7UQHc+AdIjOPHTPVOeuEwqEwLf7hQfybUmIvX24ngD+oiCfpa/sD7+
	f41smhzYu/SGOWZjpaNyZki8EkhWQ7xRTyfnvyJwk440/GGfY7YiFsmsJlgUajRBPxuK
	sJPA==
MIME-Version: 1.0
X-Received: by 10.52.64.131 with SMTP id o3mr8546307vds.116.1358523419657;
	Fri, 18 Jan 2013 07:36:59 -0800 (PST)
Received: by 10.220.224.194 with HTTP; Fri, 18 Jan 2013 07:36:59 -0800 (PST)
Received: by 10.220.224.194 with HTTP; Fri, 18 Jan 2013 07:36:59 -0800 (PST)
In-Reply-To: <20130118153407.GA20613@stefanha-thinkpad.redhat.com>
References: <CAG0b9_jOiRwSik_Np5ym=_LOiAPhuMtZOJ6kCMv+WrftnX1LAQ@mail.gmail.com>
	<20130118134205.GA24367@stefanha-thinkpad.redhat.com>
	<20130118153407.GA20613@stefanha-thinkpad.redhat.com>
Date: Fri, 18 Jan 2013 07:36:59 -0800
Message-ID: <CAG0b9_gD3d2N9Lb4dOU2UdP1AGMddh2s7b20pqEdXsG1wUaaxQ@mail.gmail.com>
From: Jason Stillwell <dragonfax@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary=20cf307ac797d9079604d391e176
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.46
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] trival patch to master to fix osx build
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
X-List-Received-Date: Fri, 18 Jan 2013 15:37:09 -0000

--20cf307ac797d9079604d391e176
Content-Type: text/plain; charset=ISO-8859-1

No?
On Jan 18, 2013 7:34 AM, "Stefan Hajnoczi" <stefanha@gmail.com> wrote:

> On Fri, Jan 18, 2013 at 02:42:05PM +0100, Stefan Hajnoczi wrote:
> > On Tue, Jan 15, 2013 at 11:52:35PM -0800, Jason Stillwell wrote:
> > > symbol isnt' defined when __APPLE__
> > > this moves the symbol to the right place so it doesn't break the build.
> >
> > Please follow http://wiki.qemu.org/Contribute/SubmitAPatch and resubmit
> > your patch inline (no attachments) and with Signed-off-by:.
>
> Please also CC qemu-devel@nongnu.org.
>
> Stefan
>

--20cf307ac797d9079604d391e176
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">No?</p>
<div class=3D"gmail_quote">On Jan 18, 2013 7:34 AM, &quot;Stefan Hajnoczi&q=
uot; &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&gt; w=
rote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On Fri, Jan 18, 2013 at 02:42:05PM +0100, Stefan Hajnoczi wrote:<br>
&gt; On Tue, Jan 15, 2013 at 11:52:35PM -0800, Jason Stillwell wrote:<br>
&gt; &gt; symbol isnt&#39; defined when __APPLE__<br>
&gt; &gt; this moves the symbol to the right place so it doesn&#39;t break =
the build.<br>
&gt;<br>
&gt; Please follow <a href=3D"http://wiki.qemu.org/Contribute/SubmitAPatch"=
 target=3D"_blank">http://wiki.qemu.org/Contribute/SubmitAPatch</a> and res=
ubmit<br>
&gt; your patch inline (no attachments) and with Signed-off-by:.<br>
<br>
Please also CC <a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.o=
rg</a>.<br>
<br>
Stefan<br>
</blockquote></div>

--20cf307ac797d9079604d391e176--

