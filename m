Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E5CCF9FE
	for <qemu-trivial@archiver.kernel.org>; Mon,  3 Nov 2025 08:01:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vFpUo-0005k9-2x; Mon, 03 Nov 2025 03:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vFpUa-0005fv-5n
 for qemu-trivial@nongnu.org; Mon, 03 Nov 2025 03:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1vFpUN-0001zq-Vs
 for qemu-trivial@nongnu.org; Mon, 03 Nov 2025 03:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762156827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WEOnqvrVe5lqRvRwouMSuCkR6COK8rXwo9PiUuo9tEc=;
 b=S+CgpU2yukHIpuj5guzHexgzWzlQWvFz2ZAdjKCigF8eNUQg4jOOxXEnlwF6+RFHYY4oEX
 HcP/C97DPobNKgi1mtS9dBm6sAcoNFWHPuT75MGQENd4Ykwg6BM7QuLyzQ10OBmUfD7X+m
 NZRLutCaj49WH0zbhdLw4rF9EuDtYWA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-8sccPOiyNpC0q1Le2-SBoQ-1; Mon, 03 Nov 2025 03:00:25 -0500
X-MC-Unique: 8sccPOiyNpC0q1Le2-SBoQ-1
X-Mimecast-MFC-AGG-ID: 8sccPOiyNpC0q1Le2-SBoQ_1762156825
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88044215975so101207386d6.1
 for <qemu-trivial@nongnu.org>; Mon, 03 Nov 2025 00:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762156825; x=1762761625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEOnqvrVe5lqRvRwouMSuCkR6COK8rXwo9PiUuo9tEc=;
 b=pSxRADO8bujNE9IHkVWgHknyOHPPdU+72vLGbzHsta955vcd/0mnvZem6XO8tm6WYM
 MIZLsp8Rize6STk6Hrk7DLDJUq6O6TzrHZf+STLBFvYwfrTmauvlJqqMgobimrDg285/
 ccC3PxKInOSeGG2QdsJlvW9I+BrM9kfIXFqZE2+EkrRtc0fM+bx6piXp/apFO5OmWcX8
 6yMF1eoL81y+w5aUkMKJabJO/e74BBc2dDUgUzoSfuGT928wds7DrY2wy9VvKHK2D332
 DBQjNJwCmRjdO4zLrj/9RhHQSI0WV+TB04qyitBYJ1bXSljzQLrmkm5eYgDuxJTGsnJ9
 IA0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQewyIuUkas6GJybICjPpvCoc7EhGqu/aVbGpY5bGH83K9w6JNdFrWyYh2F2MIelfpGqZ8yXtTvN252Cs=@nongnu.org
X-Gm-Message-State: AOJu0YwuuvK9XIUYTH7IysIzClKssbR4hqWKEGI1bqeix5tFmdShYz+d
 tbpXwo+h9f6mTx3YoTMR2fFIfxhop511FntdK/iChzKmoKUXYB4j9yBFQI6IXQCHY9AIBB2SEiI
 BgBzH37yljI5VqGlLs2nOR8fLodZdOZ6MsGIZdHXlrX7dc6YSJof3HzXmLzL26XAnQdgbB0dnP7
 vTcKf1AUypkN+LQnYOnT4eazyFr379+mGJilDuzOJPpqsb
X-Gm-Gg: ASbGnctRoyPnf3cGaD//D+SCaJmIh9pjW8e4fka3D2zuS8PKsxe8dLO6VpWMVxKApqD
 ckxFNWeKAbQzD0Z+VuDQcN6aH5GRIPdqy0lQfDlYga7adqVXDsRbY4v9brSYGbjW3RoN7QKWZlt
 +Q5+dFk5QmpPY/SAX1E8AL4XSFy0eCWWLF+Qx1WjKiV63ys7ueIc2AX4aR8Q==
X-Received: by 2002:a05:6214:1d01:b0:880:4b27:1888 with SMTP id
 6a1803df08f44-8804b272595mr68791906d6.3.1762156824905; 
 Mon, 03 Nov 2025 00:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1qEUI/ji5phzzEoagggFXrUYC2UIIeJn4HBlyYL2Gi6J9cT2vmZi4cuUvY6/qkTe5fkFYwziw6oblDyzBhqo=
X-Received: by 2002:a05:6214:1d01:b0:880:4b27:1888 with SMTP id
 6a1803df08f44-8804b272595mr68791476d6.3.1762156824395; Mon, 03 Nov 2025
 00:00:24 -0800 (PST)
MIME-Version: 1.0
References: <20251101131456.792868-1-mjt@tls.msk.ru>
 <DDXQYO68GHXQ.NZTDPMLYKROT@drigo.nl>
 <7dd27991-9fd2-4efe-8fe9-0c8e61c182ee@tls.msk.ru>
In-Reply-To: <7dd27991-9fd2-4efe-8fe9-0c8e61c182ee@tls.msk.ru>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Mon, 3 Nov 2025 10:00:13 +0200
X-Gm-Features: AWmQ_blsRTQHvEDPr1zDvnMhC9qxjBXnwyEzwDXuGlDXgU7WQFIceqQATZu_ioU
Message-ID: <CAPMcbCp042BZuMMzuW-VXPj6UF8Z296Y_p=PEB_Sc1By6s5PMw@mail.gmail.com>
Subject: Re: [PATCH trivial v3] qga: use access(2) to check for command
 existance instead of questionable stat(2)
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Rodrigo Dias Correa <r@drigo.nl>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FfGpeYj4YFfaIlo11MOf1XoWm1dd52Hvkn5bF8uWVKY_1762156825
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008e9ad40642ac1bd4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000008e9ad40642ac1bd4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Best Regards,
Kostiantyn Kostiuk.


On Sun, Nov 2, 2025 at 12:15=E2=80=AFPM Michael Tokarev <mjt@tls.msk.ru> wr=
ote:

> On 11/2/25 02:29, Rodrigo Dias Correa wrote:
> ..> Thanks for fixing it.
>
> Hi!
>
> It wasn't really broken per se.  Just confusing.
>
> Thanks,
>
> /mjt
>
>

--0000000000008e9ad40642ac1bd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto=
:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><d=
iv><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Kostiant=
yn Kostiuk.</div></div></div></div><br></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 2,=
 2025 at 12:15=E2=80=AFPM Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk=
.ru">mjt@tls.msk.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 11/2/25 02:29, Rodrigo Dias Correa wrote:<br>
..&gt; Thanks for fixing it.<br>
<br>
Hi!<br>
<br>
It wasn&#39;t really broken per se.=C2=A0 Just confusing.<br>
<br>
Thanks,<br>
<br>
/mjt<br>
<br>
</blockquote></div>

--0000000000008e9ad40642ac1bd4--


