Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r3dLQ-0002QW-EX
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2023 09:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1r3dLP-0002Pp-Dk
 for qemu-trivial@nongnu.org; Thu, 16 Nov 2023 09:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1r3dLN-0005sW-TJ
 for qemu-trivial@nongnu.org; Thu, 16 Nov 2023 09:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700144865;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYLo4a0ESgDT2HaWMJUpxhqOTvJ13Mlvod4yB+97huA=;
 b=NKO2EHFsUqE4AWAG3Eb0XVxkOLBTXPxaY+vcIyHAbWXOGpMIC275MAYRsu5qyahGnZP5ZZ
 8uaPHDPVvnLDtZjK0STsDzyPdnV0xr9lzM3WWSsvfuu/b/PDJQR8m50oQhwAquLu7akaWL
 HUKIizhsTiVWGL6GVwDqAMuvZ4ZTVxs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-2Cc1AjtnMbaN4ARECYfVDg-1; Thu, 16 Nov 2023 09:27:44 -0500
X-MC-Unique: 2Cc1AjtnMbaN4ARECYfVDg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4084e4ce543so5100405e9.3
 for <qemu-trivial@nongnu.org>; Thu, 16 Nov 2023 06:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700144862; x=1700749662;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VbNpAlf7TahvLQtqGdDwWUt1flVSQ/lOfjRYQbgGBYo=;
 b=k/zUnh6fpik9AZguroG+X1u/zrz8uWH9Hfv1U37DJah+tFlhnNU0fZOvTc+mBdU06I
 IMhpAG1JmGDLH19pk/tlx7UxJRLAL21NfwdKwV7oxzkE60PipRQlpL0WlVfzlnCXuS7s
 fHFPAQi0PFg9tqLjN6WT/sdLRysbUB0jLUsVhrtjfp/lQ080gbWmgCGQ3igludKJP4Ql
 W5svvMpLleiR+VtHQvweQCYvpgrMr2fjNNMU2qLJ7I6x7SaYMZYHu3ues8Yaf9CGW3hZ
 P66FCxA/GOIBTopMsTxyL3wBV4mQZqkeSsuYQtvnT0BdjEqCvB+jlXZ8bszCBz0HhE/C
 zjEg==
X-Gm-Message-State: AOJu0Yz0oZuDXXfDRittr4qWNPejGxfRIadeoNjtfn71wAwmwChHjNa+
 OzKk807ILYLcxuFF7IaYLEfhkrErc8W1iD0JUGOGxsUFKXbXFIIDNC55Cqk7Y3WiwskEUf02VMv
 qUXdOO6D2rtGv+QyJeszIEv/rbQFv
X-Received: by 2002:a05:600c:4708:b0:409:6edc:6e5c with SMTP id
 v8-20020a05600c470800b004096edc6e5cmr14337442wmo.0.1700144862627; 
 Thu, 16 Nov 2023 06:27:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExIoNwzsud8c8ibhtly/HkKlHbk5ieviVV2vwvFv5UvThRpmRhMDjcSHT0VvXkwd0EqwVsdg==
X-Received: by 2002:a05:600c:4708:b0:409:6edc:6e5c with SMTP id
 v8-20020a05600c470800b004096edc6e5cmr14337427wmo.0.1700144862246; 
 Thu, 16 Nov 2023 06:27:42 -0800 (PST)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c138500b003fee6e170f9sm3872406wmf.45.2023.11.16.06.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 06:27:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH trivial 06/21] docs/devel/migration.rst: spelling fix:
 doen't
In-Reply-To: <7259b384-cc7f-4400-9891-83e656765ce2@tls.msk.ru> (Michael
 Tokarev's message of "Wed, 15 Nov 2023 09:41:45 +0300")
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-7-mjt@tls.msk.ru>
 <f2bfef4a-3a2c-4d32-adf6-52317f85a045@redhat.com>
 <7259b384-cc7f-4400-9891-83e656765ce2@tls.msk.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 16 Nov 2023 15:27:41 +0100
Message-ID: <87a5rdrcwy.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.117,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Nov 2023 14:27:47 -0000

Michael Tokarev <mjt@tls.msk.ru> wrote:
> 14.11.2023 22:05, Thomas Huth wrote:
>> On 14/11/2023 17.58, Michael Tokarev wrote:
>>> Fixes: 1aefe2ca1423 "migration/doc: Add documentation for backwards com=
patiblity"
>>> Cc: Juan Quintela <quintela@redhat.com>
>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>> ---
>>> =C2=A0 docs/devel/migration.rst | 8 ++++----
>>> =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
>>> index 5adf4f12f7..51b1f61f5e 100644
>>> --- a/docs/devel/migration.rst
>>> +++ b/docs/devel/migration.rst
>>> @@ -1061,7 +1061,7 @@ QEMU version, in this case pc-5.1.
>>> =C2=A0 4 - qemu-5.1 -M pc-5.2=C2=A0 -> migrates to -> qemu-5.1 -M pc-5.=
2
>>> -=C2=A0 This combination is not possible as the qemu-5.1 doen't underst=
and
>>> +=C2=A0 This combination is not possible as the qemu-5.1 does't underst=
and
>> You replaced one typo with another one :-)
>
> Heh. Lovely! :)
>
> The "really-really-fixed" one (without resending):
>
> -  This combination is not possible as the qemu-5.1 doen't understand
> +  This combination is not possible as the qemu-5.1 doesn't understand
>    pc-5.2 machine type.  So nothing to worry here.
>
> ;)
>
> Thank you for the review and for spotting it!
>
> /mjt

Reviewed-by: Juan Quintela <quintela@redhat.com>
with the change.


