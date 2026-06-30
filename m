Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9461C43458
	for <qemu-trivial@archiver.kernel.org>; Tue, 30 Jun 2026 14:15:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1weZEt-00020M-RR; Tue, 30 Jun 2026 10:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1weZEs-0001zj-Og
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 10:15:02 -0400
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1weZEm-0003qP-Ui
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2026 10:14:59 -0400
Received: by mail-dy1-x1332.google.com with SMTP id
 5a478bee46e88-30ec3dfbcd1so3679173eec.0
 for <qemu-trivial@nongnu.org>; Tue, 30 Jun 2026 07:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782828895; cv=none;
 d=google.com; s=arc-20260327;
 b=iwxSmA89Jno6rnYA9k1lZ+63jF3Ji+q2xOwld9azvbdcsvfNndvn2X4YKFuY7nAO+0
 XMta3MUzS7oy+PFxqchwj4vbSk2MK3Vskd+1yTdEHB8VhW9ufdge/IHgYTOjtxCRCxfj
 r7ed8l1AOkgqyKE5PJUNIYQty3jAZH0eb6vpSTezEadLojqyvAXo6vLofpSr4idLc/4y
 O59XrXk0TjQQC2cnHsb+yuavBdrWy0ws2MoNG9MNCPkgE0bl6sbPhOy58jDf1CfDORWH
 jJeLInV4QFiWdExUb3KkgdD17lzfeafw3G9xs/0b6o8nE2N46GqP7LlRX/+zRfbAuwTt
 mjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UkVDLaJDNQOl4sVuHADtBAqX37JYxoOBUaM57zC9puY=;
 fh=QrzVzd2tpf4kgjZYKJRBG81ZobhPPqvbzFJetuAawN0=;
 b=abZkcZ4iN4dnUOHPVG8WxlAv2tE2A4QWi+LUtLPuRH7o3T6ywXJk9WYwHM+SitkUOa
 sJP2SSBYKZrt7NSM4xO684IBgU4RhgPLjLy4hddujLURm2uORKOYLna5t+OQuJ1LW8qB
 v+aTTyOJ0+jaebDZicuYHK/L+AF1JJnsB8kHnaLkg7TV0shpRqHZt5EekCwyljU9gksS
 NdrSv78PiliAD68JmmYrwpaNWJX7U9pm9140+HDGBG+qdy1F9dZYfLFTIsI0gUxWJx16
 ASGB6eTGwm60vVzFjZWfsTvII//h4ioMxlD2X1IDBPTgNzIU8k9LsWpefamyTAxV5zAa
 HqHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782828895; x=1783433695; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UkVDLaJDNQOl4sVuHADtBAqX37JYxoOBUaM57zC9puY=;
 b=m3suRl64cktaxIETcOPkVgDBWjmqjcCGAsF3D2W9iN1WvmnqrJXniiZv63lOCVP48B
 lVD9C7aN/7Pd1m3fTGZS6p/gjpn+1g1gIOKTFBmVCh0cgllTlrdR1b/Zui3xr5qH07U1
 2lGkxokTEvnQ+YvLTfMml6hLQy9MnLBQKgUdetQaVHSTJm2qMO4F5nr2J/aKWYRrIYB0
 ETs4qaaysxaY4yq+CuHA2gjxhUm1+H1TVuRYrTRzhb9LPs3B65tJQZgBBGQ+6wBvEB59
 aKmniWcR1jcs4ZfskPJfDCduX/6XZyv2VOvbviFJE/B1e3AqryAO7V5hyIGZSMfvS4Yg
 m+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782828895; x=1783433695;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UkVDLaJDNQOl4sVuHADtBAqX37JYxoOBUaM57zC9puY=;
 b=grZ/NuNaSPehW7B8HgFGWHwInZ4j73CKb/pgf503A/tkCAAUqSS4Upc7gevh6FVNno
 W3utwxpKnRyoc+KrAK6ikyZ6xZIOxkuEsome7PPEqyIesB/WfCV1/yuZ3fFLwkHEgwwG
 lphdyhlHYkarqJ5ud2S9BN5XUUzdnejnHLzhRh0KuVLZ2h+hpsM1tl1xA5+WvJXsGnOZ
 plqHjSLMKX/7VMQs1uiNZiz5tdD0OvWMJmlyCR++H1+Jral6aIMcrGpnr8iCl0KCUzgI
 yPtgnEdyIdXI82QlrunM2laEqmSbkoGsYxCJ498Gql1hTm4fPRvtBi8ohn5CN5HVII98
 0xPA==
X-Forwarded-Encrypted: i=1;
 AHgh+RprEdT/FkGScf1MXPmqLhJ3H86r/TD3l9Yb9g7sjNLvJMbrVzFGAtw2mKBDMb+WdlXD5DAe3AdytarAz0M=@nongnu.org
X-Gm-Message-State: AOJu0Yxtg/GIKxyjNchLQ+9JCBhpWy40O4m8rfcJieIEZoZ2OC4cUWLq
 y6GYtzUSWQblLHC301E9DnKBZa2aDz+8kjhc0HpCzJzZt50l0bc+raFCI9bK+pZ99bfVQXMDSJB
 MmFEQKUhyIKk7N1bwf14aC3uqc4m74Zs=
X-Gm-Gg: AfdE7ckkPtF78gXskPMC9SgzV0Z7hd923zccwx5Elmh77opw+CPFmffT925O61Tidte
 6OrmzLxNdRSwEihM31M+X5OSxmAZAQCsupgwhb6aAl0bgUxJ60HUuaW0HIPvrWSzdqSsQuEpjKp
 FGBGz6758eYffsAOa8kUN+AZrg7PBN+bAm6V6qTexySN4vwU5ZM7byEuMJD0hlLiyN5Aypsecpe
 S1SJa8yBQYYG+MQwFKmBed1satSToe5szLvtzTk81ni/SNKf0+E5/QCdLZmLHefoCc9H5g60UQA
 GVZivX29tWoHYmSbKFFv18BIxqBIuh8L/+48wnQ=
X-Received: by 2002:a05:7300:6409:b0:304:e2a5:689c with SMTP id
 5a478bee46e88-30ee146e255mr3473906eec.21.1782828895037; Tue, 30 Jun 2026
 07:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260626080554.1656771-1-ziyifu970225@gmail.com>
In-Reply-To: <20260626080554.1656771-1-ziyifu970225@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 30 Jun 2026 18:14:39 +0400
X-Gm-Features: AVVi8Cez40oNTl0JOFzk6vtc84sYyAdmDilGonjrHu7Wfbua4EbjwUX5oC_b20o
Message-ID: <CAJ+F1CLq=FJhE+tBgySzVCfjDkEExWv14Pe_ib4FKY22Gm=4dQ@mail.gmail.com>
Subject: Re: [PATCH] hw/usb: record async control completion for parameter
 transfers
To: Ziyi Fu <ziyifu970225@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, 
 BU Embedded <bu-embedded@cyberus-technology.de>,
 Ziyi Fu <ziyi.fu@cyberus-technology.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1332;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x1332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Fri, Jun 26, 2026 at 4:05=E2=80=AFPM Ziyi Fu <ziyifu970225@gmail.com> wr=
ote:
>
> From: Ziyi Fu <ziyi.fu@cyberus-technology.de>
>
> Record the completion side of parameter-based control transfers when they
> complete asynchronously. This lets pcap captures include descriptor
> response data for requests such as GET_DESCRIPTOR from usb-host devices.
>
> The synchronous path already recorded the completion, but the async
> SETUP_STATE_PARAM path was missing it.
>
> Signed-off-by: Ziyi Fu <ziyi.fu@cyberus-technology.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
> Tested with a usb-host HID keyboard on qemu-xhci. Before this change, the
> generated pcap contained GET_DESCRIPTOR submissions but not the correspon=
ding
> completion payloads. After this change, the pcap contains the descriptor
> payloads and Wireshark can associate endpoint 0x81 with the HID interface=
.
>
>  hw/usb/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/usb/core.c b/hw/usb/core.c
> index 9572a870cc..d71204c5c8 100644
> --- a/hw/usb/core.c
> +++ b/hw/usb/core.c
> @@ -345,6 +345,7 @@ void usb_generic_async_ctrl_complete(USBDevice *s, US=
BPacket *p)
>              p->actual_length =3D 0;
>              usb_packet_copy(p, s->data_buf, s->setup_len);
>          }
> +        usb_pcap_ctrl(p, false);
>          break;
>
>      default:
> --
> 2.51.2
>


--=20
Marc-Andr=C3=A9 Lureau

