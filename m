Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S88Es-0000iY-5Z
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 06:48:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S88El-0000O7-RC
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 06:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S88Ef-0000Xl-MN
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 06:48:51 -0400
Received: from mail-wi0-f169.google.com ([209.85.212.169]:45898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S88EU-0000VL-2A; Thu, 15 Mar 2012 06:48:34 -0400
Received: by wibhm17 with SMTP id hm17so7412397wib.4
	for <multiple recipients>; Thu, 15 Mar 2012 03:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OrN9/q/9zZ8B/okNxNKUcIFWl6QatbnOvmRP5UA8C1Q=;
	b=fh8iW1iIvWZQgdgU63muQlRgFZjRo8ENkW7i3IZ16TMCaoA9+FA4Pr3zqvbvvpDYan
	N5qbPk8rGZW9cE/tbII/cqrXZjeHfZ8sx1Cgafdi9N9XlxowplzlnB+ry7KsKN1/wcOi
	cwycTSCyxJ66XixdBsYFpsr6PU6rYCkBj9Fzciuzoi67KO66+Xe3LJUfsGMq4pbuYwin
	Yslh/WAd962yQc4rJ/gTDxsCvPMl+uEVeqAfjHG7zr4jnojoET4FdJY49smJSMNERoxt
	NQevc+zVk7wzDqSLdCweYPbB3WyKQDuzzIcGvWHphiFKf6iS42Xshv+EV78So0u8UTE1
	nX9g==
Received: by 10.216.139.29 with SMTP id b29mr3730754wej.55.1331808511066;
	Thu, 15 Mar 2012 03:48:31 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id ff9sm4168723wib.2.2012.03.15.03.48.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 03:48:30 -0700 (PDT)
Date: Thu, 15 Mar 2012 10:48:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Message-ID: <20120315104827.GB13004@stefanha-thinkpad.localdomain>
References: <1331663327-29982-1-git-send-email-mark.langsdorf@calxeda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331663327-29982-1-git-send-email-mark.langsdorf@calxeda.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.169
Cc: qemu-trivial@nongnu.org, Joshua Housh <joshua.housh@calxeda.com>,
	aliguori@us.ibm.com, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] cleanup obsolete typedef
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
X-List-Received-Date: Thu, 15 Mar 2012 10:48:56 -0000

On Tue, Mar 13, 2012 at 01:28:47PM -0500, Mark Langsdorf wrote:
> From: Joshua Housh <joshua.housh@calxeda.com>
> 
> There are no users of i2c_slave.
> 
> Signed-off-by: Joshua Housh <joshua.housh@calxeda.com>
> Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>
> ---
>  qemu-common.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

