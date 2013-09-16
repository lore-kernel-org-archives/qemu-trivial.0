Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLZ5r-000701-Bc
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2013 09:43:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLZ5i-0006yW-5S
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:43:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLZ5Z-0001VZ-Ok
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:43:50 -0400
Received: from mail-bk0-f44.google.com ([209.85.214.44]:47380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VLZ5Z-0001VM-IM
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:43:41 -0400
Received: by mail-bk0-f44.google.com with SMTP id mz10so1519473bkb.17
	for <qemu-trivial@nongnu.org>; Mon, 16 Sep 2013 06:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=jcogMtcxwCAWKv6+1kIy9v5XECOhTBTuOB+mA+0Kr5w=;
	b=dal+ywzskAylB3sZipBbxs9Kvr+VHazu0E2WmvewjzcARXR+bSNJqUg9ix9gWyubMv
	II/DDWE7s5sRNum6CEPSzguQsEg3YzPy190eMhBJDKv5zwAhob0vXMZDzbikIbwGP844
	2dOq7zIEtXfmqTPL1gaFpCtPvvh1shLaj91OiU8jJ1bRUVJytO0NjTtCsiaoUiQqoVHS
	voxC3cCp9t2+4MWBPKgsl4DlnpSnk/NjP99Mmz6rxZYrH3+tIqW3biQv7XNK8Awx7syx
	wJH/7valX2Akgo39J66mhDUbpqexeuUPeRkfelYdx9adUZTqiEzZ0hyrYiAxUfJQ4qvo
	uvrQ==
X-Gm-Message-State: ALoCoQmtBVoz1civOjCi91FEkMW8QHQur0ZhO7brWL71McBIRFHK+jYJgF6a+NgNqRoNHwSlIDB9
X-Received: by 10.204.226.135 with SMTP id iw7mr24594759bkb.4.1379339020348;
	Mon, 16 Sep 2013 06:43:40 -0700 (PDT)
Received: from [192.168.0.11] ([81.56.67.82])
	by mx.google.com with ESMTPSA id z6sm7647694bkn.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 06:43:39 -0700 (PDT)
Message-ID: <52370A95.3000103@6wind.com>
Date: Mon, 16 Sep 2013 15:41:41 +0200
From: Damien Millescamps <damien.millescamps@6wind.com>
Organization: 6WIND S.A.
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1379336175-822-1-git-send-email-damien.millescamps@6wind.com>
	<20130916130753.GM6005@redhat.com>
In-Reply-To: <20130916130753.GM6005@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.44
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND] ivshmem: allow the
	sharing of hugepages
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
X-List-Received-Date: Mon, 16 Sep 2013 13:43:57 -0000

On 09/16/2013 03:07 PM, Daniel P. Berrange wrote:
> IME this kind of auto-magical fallback behaviour is a bad idea. If we
> want to support non-SHM files for the ivshmem device, then it should
> be done with an explicit command line property. eg where we currently
> have a 'size' and 'shm' property on the cli:
>
>    -device ivshmem,size=24124324,shm=nameofshmobj
>
> it could allow an alternative 'file' property to point to a pre-created
> filename
>
>    -device ivshmem,file=/some/file/path
This patch was based on the fact that in the glibc, shm_open() is
nothing more than an open() with /dev/shm/ prepended to the shared
memory object name. Hence, only a small modification was needed to
change this behavior.

Indeed, having different parameters to specify between a file and a
POSIX shared memory object should be clearer for the user experience.

I have reworked the patch and will send it asap.

Thanks,
-- 
Damien

