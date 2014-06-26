Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X08u5-0008Nj-B8
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jun 2014 08:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08tx-0008GB-9S
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08tp-0002aA-1n
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:35:40 -0400
Received: from mail-lb0-f174.google.com ([209.85.217.174]:44621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1X08to-0002Zw-Kt
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 08:35:32 -0400
Received: by mail-lb0-f174.google.com with SMTP id u10so2842998lbd.5
	for <qemu-trivial@nongnu.org>; Thu, 26 Jun 2014 05:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LBB4jqU5Yxh4QetIUVasB8Wl6m/lMtjzKgN74ZgVJOQ=;
	b=ZFCO4OPFw5mBynyMFcOqUOLrfdME3F7K8BtaDl+5OgVecRWEFsd4MAxSZRNlMrh47i
	96w73t9Ij9/PK55P86LrhMe8+Pweh7u0CXX/ikXmd2dcDDuvA9yW+opB7WVE6jWWC9Ca
	DZKkJTAtAfg+3KNZkyq54kAZTzPQaOYBtHBvMCWDIeNj62uiN5aMxN1LTd4OJxDL+0FL
	8QrVM2U0vp2u63ojk+sLr0VqaQOsboZYErE3RvWL0rZvOk5EDi7lmYToLP0Az/KKubc+
	dH6J4S3sYDsrdakaZPrnIUk5duHw97qGCqE7XyN2ef4lutcWIDKecrvrhm+Z1hF2/HQU
	m9LQ==
X-Gm-Message-State: ALoCoQkFRBKGxVaxlI+27pnEXhkXtiwWxB45HjOxBkWoyEfdi2w8zmS+dUnOSrAyUZdOmhqRbKID
X-Received: by 10.112.85.202 with SMTP id j10mr1199959lbz.95.1403786131655;
	Thu, 26 Jun 2014 05:35:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Thu, 26 Jun 2014 05:35:11 -0700 (PDT)
In-Reply-To: <1402933631-3276-1-git-send-email-peter.maydell@linaro.org>
References: <1402933631-3276-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jun 2014 13:35:11 +0100
Message-ID: <CAFEAcA9SAZF7kg9wJz9iQKPyML_7hA0kCm5ghjr5O+373srnzA@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Give error message
 if hostfwd_add/remove for unrecognized vlan/stack
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
X-List-Received-Date: Thu, 26 Jun 2014 12:35:48 -0000

On 16 June 2014 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
> If the user specified a (vlan ID, slirp stack name) tuple in a monitor
> hostfwd_add/remove command and we can't find it, give the user an
> error message rather than silently doing nothing.
>
> This brings this error case in slirp_lookup() into line with the
> other two.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  net/slirp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index 8fddc03..647039e 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -282,6 +282,7 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *vlan,
>          NetClientState *nc;
>          nc = net_hub_find_client_by_name(strtol(vlan, NULL, 0), stack);
>          if (!nc) {
> +            monitor_printf(mon, "unrecognized (vlan-id, stackname) pair\n");
>              return NULL;
>          }
>          if (strcmp(nc->model, "user")) {
> --
> 1.9.2

Ping! (and cc trivial).

thanks
-- PMM

