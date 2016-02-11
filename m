Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTfYw-0002kn-ON
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 19:56:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aTfYu-0002kf-VZ
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 19:56:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aTfYq-0007P8-04
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 19:56:48 -0500
Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f]:34487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aTfYp-0007Oy-PB; Wed, 10 Feb 2016 19:56:43 -0500
Received: by mail-pf0-x22f.google.com with SMTP id x65so20628909pfb.1;
	Wed, 10 Feb 2016 16:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Aiv2zqvNqQPW9lCy9uB22vmlm/rRf1u0y6aNPwAszA8=;
	b=md58xrJylovhUPG1vtrlhM3YovZs6Q/r+TUDKipUD4JKpFj7YT78IP4zwzHWptxVWl
	+hD1obiBSqhih2hrfkND7lMZxuegNy/0Y6tmUQxnFClRRUoApnmUPqiTkqCjpHAeHGWS
	KKbHi5N6bK1YCTVZFmwhFx0vS0r1bYkQS1zFaQVaq3r6eEMPVHP3UqXrUO2fuQgYAqKZ
	dcGeFBzoYp4ptgOKQWyaBoYmUjuLh9IF8fbUpeROY10P2AVT4VQnQPkNhk9eWqfBAJG1
	NbQ0e4vZDJyDHqhWly6sp/5A3FMCR2cnOMARcNF0ibuEpkz/YiuO8a+MCdMfFfHP1euV
	ypcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Aiv2zqvNqQPW9lCy9uB22vmlm/rRf1u0y6aNPwAszA8=;
	b=MpQU9xTCnfqyr1ATLrN7pIhk203kBHcGJWSjTZGT58IAnl+ZsOpXLQvAwjvOHl7GyI
	/09eNjdEscTLqH1+tgCJQ8QPZLVTML4oB27qhHgVoRLmmFzkxuT/4WHS/437WxNFiglH
	prr4a8KUXI2gvl27oHbARqhXhAWQDJeyfTYjrXN/88SymRD7R+ypS1/VqCDcmnRIEQgE
	Z47s699OKNXZ8+LzQO+4EBXQmUUqf3e/tvCJNPWSZAg+bPYfsz3n0pRYUY9j6c3K9e8i
	TNI+0BCCNJ6cxL5Pwu1tnwG41Yo0KS/U2jFqT1XBTlcPtzRwCKHHO7lvQAk8uWqEYgHG
	MEzQ==
X-Gm-Message-State: AG10YORZY2zMpKeMt2ovAxfxx8uefDH0u3d3QsoXJT1z7pmMtkhvE+NiaXmRbzp8HbwXCg==
X-Received: by 10.98.2.216 with SMTP id 207mr62749385pfc.3.1455152203034;
	Wed, 10 Feb 2016 16:56:43 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	sm8sm7763645pac.43.2016.02.10.16.56.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 16:56:42 -0800 (PST)
Date: Thu, 11 Feb 2016 00:56:40 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160211005640.GA19879@vultr.guest>
References: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22f
Cc: amit.shah@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] migration: reorder code to make it
	symmetric
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Feb 2016 00:56:50 -0000

Hello everyone,

Is this one correct?

On Thu, Feb 04, 2016 at 10:50:30PM +0000, Wei Yang wrote:
>In qemu_savevm_state_complete_precopy(), it iterates on each device to add
>a json object and transfer related status to destination, while the order
>of the last two steps could be refined.
>
>Current order:
>
>    json_start_object()
>    	save_section_header()
>    	vmstate_save()
>    json_end_object()
>    	save_section_footer()
>
>After the change:
>
>    json_start_object()
>    	save_section_header()
>    	vmstate_save()
>    	save_section_footer()
>    json_end_object()
>
>This patch reorder the code to to make it symmetric. No functional change.
>
>Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>---
> migration/savevm.c |    5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/migration/savevm.c b/migration/savevm.c
>index b9caf59..42bfab4 100644
>--- a/migration/savevm.c
>+++ b/migration/savevm.c
>@@ -1088,12 +1088,11 @@ void qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only)
>         json_prop_int(vmdesc, "instance_id", se->instance_id);
> 
>         save_section_header(f, se, QEMU_VM_SECTION_FULL);
>-
>         vmstate_save(f, se, vmdesc);
>-
>-        json_end_object(vmdesc);
>         trace_savevm_section_end(se->idstr, se->section_id, 0);
>         save_section_footer(f, se);
>+
>+        json_end_object(vmdesc);
>     }
> 
>     if (!in_postcopy) {
>-- 
>1.7.9.5

-- 
Wei Yang
Help you, Help me

