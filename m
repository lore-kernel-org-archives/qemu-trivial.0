Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h2cyE-0001wv-DZ
	for mharc-qemu-trivial@gnu.org; Sat, 09 Mar 2019 09:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h2cyC-0001vZ-FK
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 09:29:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1h2cyB-0003EI-VB
	for qemu-trivial@nongnu.org; Sat, 09 Mar 2019 09:29:00 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41525)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1h2cyA-0003CO-Ci; Sat, 09 Mar 2019 09:28:58 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n2so416276wrw.8;
	Sat, 09 Mar 2019 06:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3SdPKuJuWySVTd0iqn1QYB4jcKGmz0YdxpqTm0GVhKo=;
	b=bGwd4chpZwLzmJ6UGn4sS8K7N2lEaAnIWUU/+bjzeFy/r1buEY0kkDRf/DGDL8DKKS
	mqNiIohT/myJkBiUfAMlcUVin1nldsiQP4HS24FxwiCyyEd5jqe7HtJ5kboQKCXgZEl6
	HONX/nUuIWAF2eWP56aIGMw9nTW2M4EcTuceCUBlVnb6RPe6+WAmBs7l4YiYyPH/vZpe
	l6NSAZREAh1F1j9C/vOXPkfTPkGux5OmKkYdQR0abtgAZ2zejvClQ6m5bia+A4GYEPD4
	W4XuQLDBk3h88nyaj1MPD9VH3x8TIpIvPjO8/6glO9ZrP0+wjye/g2hyK017d0QcRqa7
	C4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3SdPKuJuWySVTd0iqn1QYB4jcKGmz0YdxpqTm0GVhKo=;
	b=HM6hhthZt6POwDIxnLanSgHuix/jLCbXUSjuB8B2RChmGv4rTaEn+MDI4NvaDN2fa9
	NBMqYvOjIRCzMUcpQy9VpQs9l6ctyEREVtHX24qKr7iOHwcM/Jn5jq+YmidrbOK5cbPl
	oxczYnOvOJ/d+9azNL1ulAWahI4sl044zw/8cwD5y1XqIqZeYIyDVS/uqNFrnOyNd5W7
	+lSH8ydcvTN3jL1rLdioL56vkip9eiN8wmcBFRNmEV4AzKq7E5JPPa+GQbNNpsx0s6+e
	XW1t8qvcTjCiQdIPEWsViMXlLsVK+eFHp44ffVJI/MrZIptlwQ7DvKp38PjxRuTaHgD+
	nioQ==
X-Gm-Message-State: APjAAAUR6rdb2/b+8Vi9zQcDI6NouHTJ0WQokHqkEOniNSu+lx/ICca7
	QrQOmDBpNjtdL0eQxxQ27TRa33jGDn78XV/7Vus=
X-Google-Smtp-Source: APXvYqynLx6fF1E2ppxrBv6TFeZcQ6Jzmge4EnatCBnxymKe3c02f998VtjRcbpRg54IhGBKBGLQHmARXvttLdjiJZI=
X-Received: by 2002:a5d:55c5:: with SMTP id i5mr15942504wrw.245.1552141736633; 
	Sat, 09 Mar 2019 06:28:56 -0800 (PST)
MIME-Version: 1.0
References: <a09acf9e093c09a70896bb9886370cf7f049f941.camel@gmail.com>
In-Reply-To: <a09acf9e093c09a70896bb9886370cf7f049f941.camel@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 9 Mar 2019 14:28:45 +0000
Message-ID: <CAJSP0QUUonVQn5Qd9QSk6SnHBU-4bir6QrXQ5uaBZv33TAnFUA@mail.gmail.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Julia Suvorova <jusual@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42f
Subject: Re: [Qemu-trivial] [PATCH] thunk: improve readability of allocation
 loop
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Mar 2019 14:29:01 -0000

On Fri, Mar 8, 2019 at 7:43 PM Aarushi Mehta <mehta.aaru20@gmail.com> wrote:
>
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
>  thunk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

