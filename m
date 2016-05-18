Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b35NV-0004yo-VK
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 13:35:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1b32al-0002wu-Ig
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:36:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1b32ah-0004x0-DE
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:36:55 -0400
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:35015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1b32ah-0004vp-77
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:36:51 -0400
Received: by mail-pf0-x235.google.com with SMTP id 77so19214609pfv.2
	for <qemu-trivial@nongnu.org>; Wed, 18 May 2016 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=/hDgn/YR9x1FNeZ8m/tSWMQJ13WkcUKFVQWwtYSay0c=;
	b=oLnhmpyWpnoONnMPukcBuLKw4+wO/x9cHf0Q73rbw3LgPxsADyCgH+R4vHSG+EqqdI
	fBOL/Y50nAxtwJBS6sMdmjooUrwTPciaHVaIZJe+Twk4JClWuooVtak13rAzlAjaTn4J
	/c2TL/BkfTTbLoVWZjsKU6vgr6v2+M37En8lxSbLCOVmYncGKO833LRFFegz/cVWfLdN
	kY9bgih4oI34gcx/Wv0H3LYcNrH9+FQcchzOuNDN4lPN6Kc+eV5YoBFVZZ/E8AE9GfWE
	rNTgazVcQSIE3xLeoOhqGqo20siCVPZ10w1yN+Gwx4tW55Xyz9yQ/m8fF+6APZHFtL/M
	Y3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/hDgn/YR9x1FNeZ8m/tSWMQJ13WkcUKFVQWwtYSay0c=;
	b=kMP0r26yea5pSCh2Vw+PP5QGHNckwr2nILEJxMyVASvnc9FbNFssLGk0P3+s/Bjtf6
	3C69UEvk2FS21RB0HO5toWFPwWyKlLwQIWc+sIqei3+xCrs0pYrYGeaPemHx8eArNv7I
	cJmEYBZO0PLIzxhDx1KXLND4lBMV9+Y2suhjCqiEBDsZQ7nT1I04FMS4cTFSFScFGsr+
	rpaEotYsqnibUe2qvGyBEAxU0rpkEuoiI7vLW02JZb5BCD3XyAM/VjpfOZulEie2g0KC
	3H3kFo52Hs5Cx1cOken/GZqURYJb6wmYu71k89Kmm/UlLjkDZeWxwJvqOC4YXp6hN3na
	mylg==
X-Gm-Message-State: AOPr4FVgO8HDbRPjDoeVyt6s5lDteyu0VT4POKrjtAvBBjIRyrs4bEBEYbm0TT9uKUTPn0SA
X-Received: by 10.98.95.4 with SMTP id t4mr11596391pfb.162.1463582208963;
	Wed, 18 May 2016 07:36:48 -0700 (PDT)
Received: from [192.168.27.3] ([108.19.215.157])
	by smtp.gmail.com with ESMTPSA id
	ey12sm12908961pac.26.2016.05.18.07.36.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2016 07:36:48 -0700 (PDT)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1463569176-32122-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, mst@redhat.com
From: Corey Minyard <cminyard@mvista.com>
Message-ID: <573C7DFF.1090504@mvista.com>
Date: Wed, 18 May 2016 09:36:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463569176-32122-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::235
X-Mailman-Approved-At: Wed, 18 May 2016 13:35:25 -0400
Subject: Re: [Qemu-trivial] [PATCH] fw_cfg: follow CODING_STYLE
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
X-List-Received-Date: Wed, 18 May 2016 14:36:56 -0000

On 05/18/2016 05:59 AM, Cao jin wrote:
> Replace tab with 4 spaces; brace the indented statement.

Thanks, I think I have my editor set up to avoid the tab/space issue from
now on.  I'm going to have to handle kernel/qemu switching in my brain
for the brace issue.

Acked-by: Corey Minyard <cminyard@mvista.com>

> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   hw/nvram/fw_cfg.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 999f480..826181a 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -728,15 +728,20 @@ static int get_fw_cfg_order(FWCfgState *s, const char *name)
>   {
>       int i;
>   
> -    if (s->fw_cfg_order_override > 0)
> -	return s->fw_cfg_order_override;
> +    if (s->fw_cfg_order_override > 0) {
> +        return s->fw_cfg_order_override;
> +    }
>   
>       for (i = 0; i < ARRAY_SIZE(fw_cfg_order); i++) {
> -	if (fw_cfg_order[i].name == NULL)
> -	    continue;
> -	if (strcmp(name, fw_cfg_order[i].name) == 0)
> -	    return fw_cfg_order[i].order;
> +        if (fw_cfg_order[i].name == NULL) {
> +            continue;
> +        }
> +
> +        if (strcmp(name, fw_cfg_order[i].name) == 0) {
> +            return fw_cfg_order[i].order;
> +        }
>       }
> +
>       /* Stick unknown stuff at the end. */
>       error_report("warning: Unknown firmware file in legacy mode: %s\n", name);
>       return FW_CFG_ORDER_OVERRIDE_LAST;


