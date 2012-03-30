Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SDZZt-00040L-30
	for mharc-qemu-trivial@gnu.org; Fri, 30 Mar 2012 07:01:09 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDZZl-0003yu-Ud
	for qemu-trivial@nongnu.org; Fri, 30 Mar 2012 07:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDZZh-00048y-8K
	for qemu-trivial@nongnu.org; Fri, 30 Mar 2012 07:01:01 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:44902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SDZZg-00048A-UX
	for qemu-trivial@nongnu.org; Fri, 30 Mar 2012 07:00:57 -0400
Received: by lahe6 with SMTP id e6so618668lah.4
	for <multiple recipients>; Fri, 30 Mar 2012 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=CA/WoEL0V5LTdR53zIvMEA2t4nQ85enToOXfPukDNL0=;
	b=0bAXDVn8d8dSnBuqEQcHWnEcVMC5aIsucSZeM5b98gGrXrP5sm3K3/NqIDCqdBQHfk
	51rb30/DQsJQ2PMAyceLX9mus9N2TUIhsOMjAp1eKEnZrZimYtYvchf7hj5NmnyVP7eb
	/UGZHSAXyiRlOuSDwJAh0KWHBq4WQ3KAyAegCbeFa46ES9qyLEL7pMULhVGhUEqwgSgB
	Ccnqu7mGCLZZYaerH1SYH7SP0aC4XIE+hcbmZET8wdAbmesoJpLjcVpQAl0GfllzrMjC
	SCsv2SIoqcc2iETIMs+eES/fSKdIq4o1kKothOEsMg8BKRZoOk2yAHvnjkDVLFIBJ2z6
	IcSQ==
MIME-Version: 1.0
Received: by 10.152.135.104 with SMTP id pr8mr1905415lab.27.1333105253701;
	Fri, 30 Mar 2012 04:00:53 -0700 (PDT)
Received: by 10.112.80.167 with HTTP; Fri, 30 Mar 2012 04:00:53 -0700 (PDT)
In-Reply-To: <1333056937-14748-2-git-send-email-alevy@redhat.com>
References: <1332944776-4037-1-git-send-email-alevy@redhat.com>
	<1333056937-14748-1-git-send-email-alevy@redhat.com>
	<1333056937-14748-2-git-send-email-alevy@redhat.com>
Date: Fri, 30 Mar 2012 12:00:53 +0100
Message-ID: <CAJSP0QWdyp59YobJ-3qFyKe3QvQM3XRcTB_TpBK4REkwL2Z82w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, qemu@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] tracetool: dtrace: warn on reserved
 word usage
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
X-List-Received-Date: Fri, 30 Mar 2012 11:01:07 -0000

On Thu, Mar 29, 2012 at 10:35 PM, Alon Levy <alevy@redhat.com> wrote:
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
> =A0scripts/tracetool | =A0 =A01 +
> =A01 file changed, 1 insertion(+)

I have not merged this patch because I don't want to avoid adding
warnings that are only visible when using a specific backend.

The problem is that offending trace-events lines will be added and
later on someone who uses dtrace will find a whole list of new
warnings.

Stefan

