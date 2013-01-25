Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyrzG-0003DO-Lz
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 17:43:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1TyrzA-0002xX-T2
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 17:43:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Tyrz8-0004mN-86
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 17:43:00 -0500
Received: from mail-ee0-f47.google.com ([74.125.83.47]:56614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Tyrz4-0004lP-Fg; Fri, 25 Jan 2013 17:42:54 -0500
Received: by mail-ee0-f47.google.com with SMTP id e52so435921eek.34
	for <multiple recipients>; Fri, 25 Jan 2013 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VhnXxQKI0MmqkdIvm20lH9I4cCVz0nfGvG0PN8/FZ/4=;
	b=Rgkwpgk0SiNovjIlYPaUNjxo4HKMjgCZWZsiTIXONj6iis8MDwiHjwN5caDNNtVVnO
	wxsXyHrnbZs+KGA8mPYPXA07XFaLyhoEOaw8rmwXngw/T3im7IONLg2rd6O980jItQw7
	0mSb5n61z+r/kyBMXdpghlQdcp9xuP2qWYRmD9FKPk7cfhVmg1RWlJ/XyR22wowtAvmt
	CzKXBxmr/1XNqF50edxmKOXLdFHY+hk9OOQ1zpDQXazrOFAYkO/v4dRslVn0GKJJiDn7
	Rc4tJSM/INBMbIsa6l/FLGJQuFFJv8ocFEA1Mk5VJU/4fNx6qes6KjK0JYwWI/RFTukN
	JR5Q==
X-Received: by 10.14.173.69 with SMTP id u45mr22874948eel.21.1359153773378;
	Fri, 25 Jan 2013 14:42:53 -0800 (PST)
Received: from yakj.usersys.redhat.com (93-34-179-137.ip50.fastwebnet.it.
	[93.34.179.137])
	by mx.google.com with ESMTPS id l3sm3616297een.14.2013.01.25.14.42.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:42:52 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51030A69.2000202@redhat.com>
Date: Fri, 25 Jan 2013 23:42:49 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Vishvananda Ishaya <vishvananda@gmail.com>
References: <51024DE2.907@redhat.com>
	<1359140240-42972-1-git-send-email-vishvananda@gmail.com>
In-Reply-To: <1359140240-42972-1-git-send-email-vishvananda@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.47
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Adds mirroring tests for resized
	images
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
X-List-Received-Date: Fri, 25 Jan 2013 22:43:05 -0000

Il 25/01/2013 19:57, Vishvananda Ishaya ha scritto:
> This test verifies two mirroring issues are fixed with resized images:
> 
>  * sync='top' creates an image that is the proper size
>  * sync='full' doesn't cause an assertion failure and crash qemu
> ---
> These are tests for my patches for the following bugs:
> 
> https://bugs.launchpad.net/qemu/+bug/1103868
> https://bugs.launchpad.net/qemu/+bug/1103903
> 
>  tests/qemu-iotests/041     |   48 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/041.out |    4 ++--
>  2 files changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
> index c6eb851..e7c004a 100755
> --- a/tests/qemu-iotests/041
> +++ b/tests/qemu-iotests/041
> @@ -292,6 +292,54 @@ class TestMirrorNoBacking(ImageMirroringTestCase):
>          self.assertTrue(self.compare_images(test_img, target_img),
>                          'target image does not match source after mirroring')
>  
> +class TestMirrorResized(ImageMirroringTestCase):
> +    backing_len = 1 * 1024 * 1024 # MB
> +    image_len = 2 * 1024 * 1024 # MB
> +
> +    def setUp(self):
> +        self.create_image(backing_img, TestMirrorResized.backing_len)
> +        qemu_img('create', '-f', iotests.imgfmt, '-o', 'backing_file=%s' % backing_img, test_img)
> +        qemu_img('resize', test_img, '2M')
> +        self.vm = iotests.VM().add_drive(test_img)
> +        self.vm.launch()
> +
> +    def tearDown(self):
> +        self.vm.shutdown()
> +        os.remove(test_img)
> +        os.remove(backing_img)
> +        try:
> +            os.remove(target_img)
> +        except OSError:
> +            pass
> +
> +    def test_complete_top(self):
> +        self.assert_no_active_mirrors()
> +
> +        result = self.vm.qmp('drive-mirror', device='drive0', sync='top',
> +                             target=target_img)
> +        self.assert_qmp(result, 'return', {})
> +
> +        self.complete_and_wait()
> +        result = self.vm.qmp('query-block')
> +        self.assert_qmp(result, 'return[0]/inserted/file', target_img)
> +        self.vm.shutdown()
> +        self.assertTrue(self.compare_images(test_img, target_img),
> +                        'target image does not match source after mirroring')
> +
> +    def test_complete_full(self):
> +        self.assert_no_active_mirrors()
> +
> +        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
> +                             target=target_img)
> +        self.assert_qmp(result, 'return', {})
> +
> +        self.complete_and_wait()
> +        result = self.vm.qmp('query-block')
> +        self.assert_qmp(result, 'return[0]/inserted/file', target_img)
> +        self.vm.shutdown()
> +        self.assertTrue(self.compare_images(test_img, target_img),
> +                        'target image does not match source after mirroring')
> +
>  class TestReadErrors(ImageMirroringTestCase):
>      image_len = 2 * 1024 * 1024 # MB
>  
> diff --git a/tests/qemu-iotests/041.out b/tests/qemu-iotests/041.out
> index 71009c2..3a89159 100644
> --- a/tests/qemu-iotests/041.out
> +++ b/tests/qemu-iotests/041.out
> @@ -1,5 +1,5 @@
> -..................
> +....................
>  ----------------------------------------------------------------------
> -Ran 18 tests
> +Ran 20 tests
>  
>  OK
> 

The patch doesn't apply to the block branch, but the conflicts should be
trivial.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

