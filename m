Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cUZxe-0006JT-RH
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2017 09:14:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cUZxc-0006H2-5z
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 09:14:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1cUZxX-0004XE-8J
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 09:14:36 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:62311)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1cUZxW-0004V6-TP
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2017 09:14:31 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue101 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0Luu5B-1cMIJp0m0X-0104sO for <qemu-trivial@nongnu.org>; Fri, 20 Jan 2017
	15:14:28 +0100
To: qemu-trivial@nongnu.org
References: <1484917864-7928-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9bc84522-eaef-98d4-a04a-ed7dad9cd127@vivier.eu>
Date: Fri, 20 Jan 2017 15:14:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484917864-7928-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:R/rxvFeSa7S5Kavbe/tdQwi4k1+hdHaaES3ZTEqxq7y4XZW5vGa
	THDLm6LTv742X0cUGRXctUF6XkXqUNxEqXpK8zibKpiZuB41m5kM3GnKetVZTye5GtGN8og
	fwlLaR+qB14RdgL6OJ+spXR8arPEFLLJoRKgn6xoLoQe456eKRRegKUeuZyxJa8oFWsVGfH
	9B3bqP3IbYHGTCYiaTNRA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:gku8RIBTrBk=:RRAgPL138Cqt6E3hK2j46A
	0ORPZBOI92x1iCAAiUUqH+KHpwuceO7BDrccif4s3oUNdWU+US8UR/YlrR/ztmlStDSaghmTg
	e53tEUCFvc0VPAF3AzsVACTuUlMQSJxNfRcJT5adnR8YtCedldlbeaHYOY+g6jj+QXASBNEWJ
	4ewNg7jp/6H6wZ9HDtgfEAW8yQerMo55kUwKRR3ogTFEvWQaYcpRzcpPe9sXZLwDjrvzCtmor
	zrU0aec4U8xI4+d+QerKHhYXMwNmRvY0V2HE0jVjhb6bUBz3XabAdvHznMgDCH6TFCWFuIxcq
	H6vAHLOhaneyp+sicfXNwqbV9kSyjMTW3pzbXkYYGaRLveJ2DWDVoFR/L6K5sa3YJMZX0wZZm
	tj3YE44RD+QGhts+oze0C4L2x4pgYdAPzzkiU4LyA2+VyIQhOSDSysasC0UkdusXhcFEhSgSL
	JCtJNHCM+4A13Z2tTEoQHumewyme0y1JpG9b9L/yVKt5tZHLTkuU2Ciwgz2LyhUJWKVRVY/QF
	YLvp/camGlFP1B5thl0mg4Kpiu+XckiVfzfYZTBqX9PRS+EXAp22XdQjtJ5eKlQ1MC7RNtx38
	ue4/OAer+Te88YyyrGp0NOHcsWz1E9uYrRaMvWh77CiSPfpwDYoglVX9NuOOMDD6yk4k9GEQL
	XuWeiGNnV1goJnwocasQ+NioLjkB860FSWRdw+JqcdY1bm8lnYuiEjGb+ZCxhDpw/h6VZMcvJ
	P0mczIDWhGOSshHA
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] usb: Set category and description of the
 MTP device
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
X-List-Received-Date: Fri, 20 Jan 2017 14:14:37 -0000

Le 20/01/2017 à 14:11, Thomas Huth a écrit :
> It's a storage device, so let's classify it accordingly. And
> while we're at it, also add a short description for people who
> do not know what MTP means.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/dev-mtp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> index 9cb0f50..bb73809 100644
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -1580,6 +1580,8 @@ static void usb_mtp_class_initfn(ObjectClass *klass, void *data)
>      uc->handle_reset   = usb_mtp_handle_reset;
>      uc->handle_control = usb_mtp_handle_control;
>      uc->handle_data    = usb_mtp_handle_data;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    dc->desc = "USB Media Transfer Protocol device";
>      dc->fw_name = "mtp";
>      dc->vmsd = &vmstate_usb_mtp;
>      dc->props = mtp_properties;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


