Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmGvT-0006JQ-Kd
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 02:19:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WmGvN-0006AX-15
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 02:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WmGvG-0006vR-Ti
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 02:19:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WmGv4-0006u5-9z; Mon, 19 May 2014 02:19:30 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4J6JShn009024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 19 May 2014 02:19:28 -0400
Received: from [10.36.116.36] (ovpn-116-36.ams2.redhat.com [10.36.116.36])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4J6JQ7Q011060; Mon, 19 May 2014 02:19:27 -0400
Message-ID: <1400480365.32155.21.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Date: Mon, 19 May 2014 08:19:25 +0200
In-Reply-To: <1400336958-32463-1-git-send-email-sw@weilnetz.de>
References: <1400336958-32463-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Automatically
 select GTK+ 3.0 if GTK+ 2.0 is unavailable
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
X-List-Received-Date: Mon, 19 May 2014 06:19:55 -0000

  Hi,

> +if test "$gtkabi" = ""; then
> +    # The GTK ABI was not specified explicitly, so try whether 2.0 is available.
> +    # Use 3.0 as a fallback if that is available.
> +    if $pkg_config --exists "gtk+-2.0 >= 2.18.0"; then
> +        gtkabi=2.0
> +    elif $pkg_config --exists "gtk+-3.0 >= 3.0.0"; then
> +        gtkabi=3.0
> +    else
> +        gtkabi=2.0
> +    fi
> +fi

Shouldn't we probe for gtk3 first?

cheers,
  Gerd



