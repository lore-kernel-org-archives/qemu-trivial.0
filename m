Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RVgBu-0003W9-77
	for mharc-qemu-trivial@gnu.org; Wed, 30 Nov 2011 04:10:58 -0500
Received: from eggs.gnu.org ([140.186.70.92]:43081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RVgBr-0003Mh-HP
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 04:10:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RVgBn-0002KP-Fp
	for qemu-trivial@nongnu.org; Wed, 30 Nov 2011 04:10:55 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:59688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RVgBl-0002Jt-9u; Wed, 30 Nov 2011 04:10:49 -0500
Received: by eaai10 with SMTP id i10so459500eaa.4
	for <multiple recipients>; Wed, 30 Nov 2011 01:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=RfVQxS6oVH6tqa1YoNo+O7JcBnpqBZ0ZjqfgyZ4aGRw=;
	b=o3W8tOnHuxf4ycDVG9WMcjCyvQEUTYIlaG8WH3vW8YlcFiBSiRb1iuDfekJgIjbjsx
	T0NYniHpZYw44KEVo7sO8v5th052DuWtVPP0ApN2t4HDRqYyTNWeIrQ+MsSMEHY4B2SU
	QqDWPC55LDA3XNRUDeFReF0FZYMlD4lEQWI0Y=
MIME-Version: 1.0
Received: by 10.227.207.133 with SMTP id fy5mr511581wbb.23.1322644248481; Wed,
	30 Nov 2011 01:10:48 -0800 (PST)
Received: by 10.180.101.168 with HTTP; Wed, 30 Nov 2011 01:10:48 -0800 (PST)
In-Reply-To: <1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
Date: Wed, 30 Nov 2011 09:10:48 +0000
Message-ID: <CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org,
	stefano.stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] Makefile: use full path for
 qapi-generated directory
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
X-List-Received-Date: Wed, 30 Nov 2011 09:10:56 -0000

On Tue, Nov 29, 2011 at 10:47 PM, Michael Roth
<mdroth@linux.vnet.ibm.com> wrote:
> Generally $(BUILD_DIR) =3D=3D $(CURDIR), but that isn't necessarilly the
> case, so use $(BUILD_DIR)/qapi-generated for generated files to
> avoid potentionally sticking generating files in odd places outside
> the build's include paths.
> ---
> =A0Makefile | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

Not applied to trivial tree yet.  I want to let Stefano, Stefan Weil,
or Anthony take a look too since we were all discussing these changes
yesterday.

Stefan

